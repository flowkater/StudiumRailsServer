json.partys @parties do |json, party|
	json.(party, :id, :body, :date, :starttime, :endtime, :place)
end