class Test < ApplicationRecord
  self.def list_names(categity)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
        .where(categories: {title: categity})
        .order('tests.title DESC')
        .pluck(:title)
  end
end
