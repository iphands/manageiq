module ContainerGroupHelper::TextualSummary
  #
  # Groups
  #

  def textual_group_properties
    items = %w(namespace)
    items.collect { |m| send("textual_#{m}") }.flatten.compact
  end

  #
  # Items
  #

  def textual_namespace
    {:label => "Namespace", :value => @record.namespace}
  end
end
