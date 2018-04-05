class AddPaperclipToProjects < ActiveRecord::Migration[5.0]
  def change
    add_attachment :projects, :photo
  end
end
