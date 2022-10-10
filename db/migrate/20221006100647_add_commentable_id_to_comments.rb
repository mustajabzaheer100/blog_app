# frozen_string_literal: true

class AddCommentableIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :commentable_id, :integer
  end
end
