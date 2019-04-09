# frozen_string_literal: true

# Decorator for reply class
class ReplyDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def display_replies
    if model.blank?
      h.no_record_tr(5)
    else
      h.render model
    end
  end
end
