class StaticToolsController < ApplicationController

  before_action :set_static_tool, only: [:pak_player, :quiz_result, :update_share_count]
  before_action :static_tool_data, only: [:pak_player, :quiz_result]

  def pak_player
  end

  def quiz_result
    @result = @static_tool.calculate_result(params, @static_data)
    @static_tool.record_response

    respond_to do |format|
      format.js
    end
  end

  def update_share_count
    @static_tool.update_share_count

    respond_to do |format|
      format.json { render json: :ok }
    end
  end

  private

  def set_static_tool
    @static_tool = StaticTool.find_tool(params[:id], params[:action])
    redirect_to root_url, alert: 'This is an invalid Url' if @static_tool.blank?
  end

  def static_tool_data
    @static_data = YAML.load_file("#{Rails.root}/config/data/#{@static_tool.page_key}.yml")
  end

end
