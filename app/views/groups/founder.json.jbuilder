json.(@group, :recruit)
json.users @waiting_users do |json, user|
	json.id user.id
	json.email user.email
	json.name user.name
	json.gender user.gender
	json.phone user.phone	
	if user.avatar.url(:thumb)
		json.image user.avatar.url(:thumb)
	end
end
