# User Show Account buttons
Deface::Override.new(:virtual_path => %q{spree/users/show},
                     :insert_after => "table.order-summary thead tr th:last",
                     :name => "invoice_print_user_header",
                     :original => '7c5b08391260ff6a500af7c180d4d8dff39670f6',
                     :text => "<th><%= t(:invoice, :scope => :spree) %></th>")

Deface::Override.new(:virtual_path => %q{spree/users/show},
                     :insert_after => "table.order-summary tbody tr td:last",
                      :name => "invoice_print_user_link",
                      :original => 'fe39861e6c0a7d7808768a2bb45f17bf367a78a6',
                      :text => %q{<td><%= link_to t(:show, :scope => :spree), pdf_invoice_path(:order_id => order.id, :format => :html), :onclick => "window.open(this.href, '#{t(:invoice, :scope => :spree)}', 'width=745,height=892,left=100,top=100,menubar=no,toolbar=yes,scrollbars=yes,location=no,hotkeys=yes'); return false;" %><%= link_to t(:download, :scope => :spree), pdf_invoice_path(:order_id => order.id, :format => :pdf) %></td>})
