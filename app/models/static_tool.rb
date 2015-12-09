class StaticTool < ActiveRecord::Base

  has_many :response_dates, as: :dateable, dependent: :destroy

  def self.find_tool(id, action)
    return StaticTool.find_by_id(id) if id.present?
    StaticTool.find_by_page_key(action)
  end

  def calculate_result(params, tool_data)
    case tool_data['page_key']
    when 'pak_player'
      self.calculate_pak_player_result(params, tool_data)
    end
  end

  def calculate_pak_player_result(params, tool_data)
    players = tool_data['players']

    params.each do |key, value|
      if key.include? 'answer'
        question_number = key.split('-').last.to_i
        answer = tool_data['answers'][question_number][value.to_i]

        players.each do |player, score|
          players[player] = score + answer[player]
        end
      end
    end

    selected_player = players.max_by{ |player, score| score }
    { page_key: tool_data['page_key'] }.merge(tool_data['result'][selected_player.first])
  end

  def record_response
    response = self.response_dates.find_or_initialize_by(date: Date.today)

    self.with_lock do
      self.increment!(:response_count)
      response.lock!
      response.increment!(:response_count)
    end
  end

end
