# db/seeds.rb

# First, check if user exists, if not create it
user = User.find_by(email: 'demo@example.com')
unless user
  user = User.create!(
    email: 'demo@example.com',
    password: 'password123',
    password_confirmation: 'password123'
  )
end

posts_data = [
  {
    title: "The Art of Mountain Climbing",
    body: "Mountain climbing is not just about reaching the summit. It's about the journey, the preparation, and the mental fortitude required to push through challenging conditions. Every climb teaches you something new about yourself.",
    date: DateTime.new(2024, 1, 15, 9, 30)
  },
  {
    title: "Understanding Quantum Computing",
    body: "Quantum computing represents a paradigm shift in how we process information. Unlike classical computers that use bits, quantum computers leverage quantum bits or 'qubits' that can exist in multiple states simultaneously.",
    date: DateTime.new(2024, 1, 16, 14, 15)
  },
  {
    title: "The Perfect Cup of Coffee",
    body: "The secret to brewing the perfect cup of coffee lies in the details: water temperature should be between 195-205°F, use freshly ground beans, and maintain a proper coffee-to-water ratio. Your morning brew will never be the same.",
    date: DateTime.new(2024, 1, 17, 8, 45)
  },
  {
    title: "Sustainable Urban Gardens",
    body: "Creating a sustainable urban garden is possible even in small spaces. Container gardening, vertical growing systems, and proper composting can transform any balcony or patio into a thriving green space.",
    date: DateTime.new(2024, 1, 18, 11, 20)
  },
  {
    title: "The History of Jazz",
    body: "Jazz emerged from the cultural melting pot of New Orleans in the late 19th century. It combined elements of blues, ragtime, and European classical music to create something entirely new and uniquely American.",
    date: DateTime.new(2024, 1, 19, 16, 30)
  },
  {
    title: "Mindful Meditation Practices",
    body: "Mindfulness meditation isn't about clearing your mind completely. It's about observing your thoughts without judgment and gradually returning your focus to your breath or chosen anchor point.",
    date: DateTime.new(2024, 1, 20, 7, 15)
  },
  {
    title: "The Future of Electric Vehicles",
    body: "As battery technology improves and charging infrastructure expands, electric vehicles are becoming increasingly practical for everyday use. The next decade will likely see a dramatic shift away from traditional combustion engines.",
    date: DateTime.new(2024, 1, 21, 13, 45)
  },
  {
    title: "Traditional Bread Making",
    body: "There's nothing quite like the smell of freshly baked bread. The ancient art of breadmaking requires just four ingredients: flour, water, salt, and yeast. Yet the possibilities for creation are endless.",
    date: DateTime.new(2024, 1, 21, 15, 10)
  },
  {
    title: "Photography Basics",
    body: "Understanding the exposure triangle - ISO, aperture, and shutter speed - is fundamental to photography. These three elements work together to create properly exposed images and creative effects.",
    date: DateTime.new(2024, 1, 22, 10, 25)
  },
  {
    title: "The Power of Habit",
    body: "Habits shape our daily lives more than we realize. Understanding the habit loop - cue, routine, reward - can help us break bad habits and form beneficial ones that last.",
    date: DateTime.new(2024, 1, 22, 12, 30)
  }
]

# Clear existing posts before creating new ones
Post.delete_all

posts_data.each do |post_data|
  user.posts.create!(post_data)
end

puts "Seeded #{Post.count} posts for user #{user.email}"