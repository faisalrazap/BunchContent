class StaticToolsController < ApplicationController

  before_action :set_static_tool, only: [:pak_player]

  def pak_player
  end

  private

  def set_static_tool
    @static_tool = StaticTool.find_by_page_key(params[:action])
    redirect_to root_url, alert: 'This is an invalid Url' if @static_tool.blank?
  end

end
