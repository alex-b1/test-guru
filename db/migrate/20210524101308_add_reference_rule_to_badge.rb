class AddReferenceRuleToBadge < ActiveRecord::Migration[6.1]
  def change
    add_reference :rules, :badge, index: true
  end
end
