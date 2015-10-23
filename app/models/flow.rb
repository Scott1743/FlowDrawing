class Flow
  include Workflow

  def self.eval_workflow code
    workflow do
      eval code
    end
  end
end