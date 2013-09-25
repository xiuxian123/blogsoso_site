# -*- encoding : utf-8 -*-
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  unless html_tag =~ /^<label/
    %{<span class="field_with_errors">#{html_tag}<label for="#{instance.send(:tag_id)}" class="error_message">#{instance.error_message.first}</label></span>}.html_safe
  else
    %{<span class="label_with_errors">#{html_tag}</span>}.html_safe
  end
end

