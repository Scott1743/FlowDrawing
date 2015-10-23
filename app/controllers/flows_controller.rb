require "workflow/draw"

class FlowsController < ApplicationController

  def new
  end

  def create
    code = params[:code]
    begin
      Flow.eval_workflow code
      g = Workflow::Draw::workflow_diagram(Flow)
    rescue
      respond_to text: "语法错误"
    end
    send_file "./flows_workflow.png"
  end

end
