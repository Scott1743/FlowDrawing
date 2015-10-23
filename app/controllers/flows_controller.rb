#encoding utf-8
require "workflow/draw"

class FlowsController < ApplicationController

  def new
  end

  def create
    code = params[:code]
    begin
      Flow.eval_workflow code
      g = Workflow::Draw::workflow_diagram(Flow, font: "wqy-zenhei")
    rescue
      return render text: "sytax error ..."
    end
    send_file "./flows_workflow.png"
  end

end
