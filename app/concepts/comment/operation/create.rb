class Comment::Create < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(Comment, :new)
    step :assign_thing!
    step Contract::Build(constant: Comment::Contract::Create)

    def assign_thing!(options, params:, **)
      options['model'].thing = Thing.find_by_id(params[:thing_id]) || Thing.new
    end
  end

  step Nested(Present)
  step Contract::Validate(key: :comment)
  step Contract::Persist()
end
