json.posts @all_posts do |post|
   json.extract! post, :id, :title, :description
end