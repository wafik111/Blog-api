class CleanPosts
    include Sidekiq::Worker
  
    def perform(id)
      Post.destroy(id)
      puts "---------#{id}---------done-----------------"
    end
end