# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'csv'

# Définir le chemin vers le fichier CSV
csv_file_path = Rails.root.join('db', 'seeds', 'shares.csv')

# Lire et importer le fichier CSV
puts "Importing shares from CSV..."

CSV.foreach(csv_file_path, headers: true) do |row|
  Share.find_or_create_by!(
    title: row['title'].strip,
    description: row['description'].strip,
    price: row['price'].to_f,
    signature: row['signature'].present? ? row['signature'].strip : " "
  )
end

puts "Shares imported successfully!"

csv_file_path = Rails.root.join('db', 'seeds', 'starters.csv')

# Lire et importer le fichier CSV
puts "Importing starters from CSV..."

CSV.foreach(csv_file_path, headers: true) do |row|
  # Crée ou met à jour une instance du modèle Share
  Starter.find_or_create_by!(
    title: row['title'].strip,
    price: row['price'].to_f,
  )
end

puts "Starters imported successfully!"

csv_file_path = Rails.root.join('db', 'seeds', 'desserts.csv')

# Lire et importer le fichier CSV
puts "Importing desserts from CSV..."

CSV.foreach(csv_file_path, headers: true) do |row|
  # Crée ou met à jour une instance du modèle Share
  Dessert.find_or_create_by!(
    title: row['title'].strip,
    price: row['price'].to_f,
  )
end

#
