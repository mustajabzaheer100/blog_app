# frozen_string_literal: true

class AddCommentableTypesToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :commentable_type, :string
  end
end
