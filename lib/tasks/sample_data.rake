namespace :db do

	task populate: :environment do
		topics_hash = {
			1 => ["Analytics",
				"Category Analytics"],
				2 => ["Digital Marketing",
					"Category Digital Marketing"],
					3 => ["Entrepreneurship",
						"Category Entrepreneurship"]
					}

					topics_hash.each do |key, array|
						Topic.create!(
							name: array[0],
							desc: array[1],
							)
					end

		courses_hash = {
			1 => ["Analytics Using SAS", 
			 	"Learn Big data analytics using the language of SAS",1
			 	],
			2 => ["SOCIAL MEDIA MARKETING", 
			 	"Gaining traffic & attention through social media",1
			 	],
			3 => ["FINANCIAL MODELING", 
			 	"Learn Big data analytics using the language of SAS",1
			 	]
			}

			courses_hash.each do |key, array|
			Course.create!(title: array[0],
			desc: array[1],
			topic_id: array[2],
			short_desc: array[1],
			ispublished: 1 ,
			start_date: '2013-05-03' ,
			end_date: '2013-12-03',
			isconcluded: 'f',
			)
			end

			@courses=Course.all
			course_price_hash={
				1=>[@courses[0].id,"10000","2013-02-01","2014-03-31"],
				2=>[@courses[1].id,"10000","2013-02-01","2014-03-31"],
				3=>[@courses[2].id,"10000","2013-02-01","2014-03-31"],
			}
			course_price_hash.each do |key,array|
				CoursePricing.create!(course_id:array[0],
					price:array[1],
					start_date:array[2],
					end_date:array[3])
			end

			TaxRate.create!(valid_from:"2013-03-01", valid_until:"2050-03-31",factor:0.0, is_default: true, description: "Service Tax")
	end
end
