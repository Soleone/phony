module MessagesHelper
  def message_filter_link(number, field)
    link_to(number, [:messages, {filter: {field => number}}])
  end
end
