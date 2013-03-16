namespace :db do
# 	desc "Fill database with sample data"
task populate: :environment do
# # t.string :title
# #       t.strng :author
# #       t.int :course_id
# #       t.string :category
# #       t.string :image
# #       t.string :desc


users_hash = {
			1 => [Faker::Name.name, #Name
				Faker::Internet.free_email, #email
				"password1", #password
				1, #user_type
				1, #sub_plan
				"This is a dummy message about user. This will tell soemthing about this user."
				],
			2 => [Faker::Name.name, #Name
				Faker::Internet.free_email, #email
				"password2", #password
				1, #user_type
				2, #sub_plan
				"This is a dummy message about user. This will tell soemthing about this user."
				],
			3 => [Faker::Name.name, #Name
				Faker::Internet.free_email, #email
				"password3", #password
				2, #user_type
				1, #sub_plan
				"This is a dummy message about user. This will tell soemthing about this user."
				],
			4 => [Faker::Name.name, #Name
				Faker::Internet.free_email, #email
				"password4", #password
				3, #user_type
				2, #sub_plan
				"This is a dummy message about user. This will tell soemthing about this user."
				],
			5 => [Faker::Name.name, #Name
				Faker::Internet.free_email, #email
				"password5", #password
				2, #user_type
				2, #sub_plan
				"This is a dummy message about user. This will tell soemthing about this user."
				],
			6 => [Faker::Name.name, #Name
				Faker::Internet.free_email, #email
				"password6", #password
				2, #user_type
				2, #sub_plan
				"This is a dummy message about user. This will tell soemthing about this user."
				],
			7 => [Faker::Name.name, #Name
				Faker::Internet.free_email, #email
				"password7", #password
				2, #user_type
				2, #sub_plan
				"This is a dummy message about user. This will tell soemthing about this user."
				],
			8 => [Faker::Name.name, #Name
				Faker::Internet.free_email, #email
				"password8", #password
				2, #user_type
				2, #sub_plan
				"This is a dummy message about user. This will tell soemthing about this user."
				],
			9 => [Faker::Name.name, #Name
				Faker::Internet.free_email, #email
				"password9", #password
				2, #user_type
				2, #sub_plan
				"This is a dummy message about user. This will tell soemthing about this user."
				],
			10 => [Faker::Name.name, #Name
				Faker::Internet.free_email, #email
				"password10", #password
				2, #user_type
				2, #sub_plan
				"This is a dummy message about user. This will tell soemthing about this user."
				],
			11 => ["Ankit Gupta", #Name
				"ankithbti007@gmail.com", #email
				"password123", #password
				3, #user_type
				2, #sub_plan
				"This is a dummy message about user. This will tell soemthing about this user."
			]
		}

		users_hash.each do |key, array|
			User.create!(name: array[0],
				email: array[1],
				password: array[2],
				password_confirmation: array[2],
				user_type: array[3],
				sub_plan: array[4],
				user_desc: array[5])
		end


		#FAQ block for test data
		faqs_hash= {
			1 => ["What are your payment plans and options?", #question
				"You can sign up for a monthly subscription ($19 a month) or a yearly subscription ($180 a year, save 20%). We also offer discounts for groups of 5 or more.", #answer
				5
				],
			2 => ["How do I upgrade my Basic membership?", #question
				"If you have a pre-existing $9 a month membership you will be able to continue accessing Tutorials and Source Files into the future. To become a full member and access eBooks and our library of courses, you'll need to upgrade your account to the current membership plan. This will be an additional $10 a month and is a separate subscription that works in tandem with your Basic membership to give you full access. You can upgrade at any time via your My Account area. The two subscriptions in tandem will total $19 a month (less if your Basic membership was discounted).", #answer
				6
				],
				3 => ["Do you offer any other payment methods, besides PayPal and Moneybookers (Skrill)?",
					"At this time pure credit card payments are not supported. However, it's easy to pay with your credit card through PayPal.",
					7
					],
					4 => ["What SmartCoach can provide?",
						"We founded SmartCoach to help you learn the skills you need to create wonderful things. Whether that's an award-winning web design, a popular web app, a breathtaking video project, or a sought-after freelance business, we believe you can do it.
						Becoming a member is the best way to learn and improve the skills that are most important to you: skills that can help you practice your most passionate hobbies, super-charge your career, or go from paper-pusher to creative mastermind.
						Over three years we've helped more than 45,000 members learn cutting-edge skills across top creative and tech fields like design, photography, web development, motion graphics and much more.
						Because we believe education should be accessible to everyone, a SmartCoach Premium membership is a fraction of the cost of schools and formal training. According to many of our members, it's just as good - if not better.",
						1
						],
						5 => ["Why to join SmartCoach?",
							"It's easy to learn software, but what should you make with it?
							It's easy to learn tips and techniques, but when and how should you use them?
							SmartCoach is designed to help you grasp and practice complete skills. Learning via tutorials, eBooks and courses means that topics are covered in-depth from many different angles, leaving you with a well-grounded understanding of how to apply the skills you've learned.
							We've worked with legends across many industries to bring you training that is unmatched in quality, teaching you best-practices and good technique. Every resource is created by experts and reviewed by experts.
							Self-learning can be the most important form of education in your life. If you care about giving yourself the best education, you'll treasure your SmartCoach Premium membership.",
							2
							],
							6 => ["Who is the coach here ?",
								"A good teacher makes all the difference.
								Do you remember your favorite teacher from school? You probably learned more in his or her classes than you learned anywhere else. The best teachers make learning easy and fun.
								These are the kinds of Instructors we have on our team. If you've ever tried to learn a skill but just didn't 'get' your teacher, we think you'll love learning with our instructors at SmartCoach.
								Meet our coaches by pressing coaches link in sub header menu.",
								3
								],
								7 => ["What is the quality of tutorials here ?",
									"Our tutorials teach you one technique comprehensively and in great detail. When you complete a tutorial, we want to make sure that whatever you're learning, you really get it. Every tutorial goes above and beyond the quality and depth you can expect to find anywhere else. Our library includes both video and written tutorials with screenshots, so you can learn exactly how you like to learn.
									members get immediate access to hundreds of lessons and resources, but better yet, our library is always growing. We're adding new tutorials, courses and eBooks all the time, covering a broad range of creative and technical skills. There will always be something new and interesting for you to explore.",
									4
									],
									8 => ["I need to cancel my membership. What do I do?",
										"Membership cancellation is handled through your payment provider. You can cancel your membership at any time, for any reason.",
										8
										],
										9 => ["What should I do if something isn't working?",
											"If you notice that something isn't working as it should be, we'd like to fix it. Please submit a Support Ticket so we can work on resolving the issue.",
											9
											],
											10 => ["What are the Terms & Conditions for SmartCoach Premium?",
												"You can view the current Terms and Conditions for SmartCoach by pressing the link in the fotter of the page. ",
												10
												],
												11 => ["Why is my membership inactive?",
													"A membership is inactive if it has not yet been paid for. If you believe you have paid for your membership, but its status is still inactive, you may have paid via eCheque. eCheques are a PayPal debit to your bank account, and can take several business days to clear. Your membership will not become active until the eCheque clears and we receive your payment (you can check the status of your payment in PayPal).
													If you believe you have paid for your membership by a method other than eCheque and it is still not listed as active, you should create a support ticket before trying to make another payment. Please include your SmartCoach username and describe anything unusual you noticed while trying to sign up and pay for your membership.",
													11
												]




											}

											faqs_hash.each do |key, array|
												Faq.create!(question: array[0],
													answer: array[1],
													order_id: array[2]
													)
											end


		# Course.create!(title: "Example Title",
		# author: "Example Author",
		# category: "Example category",
		# image: "Example Image",
		# desc: "Example Desc")

		# Topic categories for Courses
		# topics_arr = ["", 
		# 	"Web Design", 
		# 	"Software Development",
		# 	"Business",
		# 	"Photoshop",
		# 	"Mobile development"
		# ]
		

		# topics_arr.each do |topic|
		# 	Topic.create!(name: topic)
		# end

	 #  #Topic Description
	 #  topics_desc_arr = ["Topic Web Development", 
		# 	"Topic Web Design", 
		# 	"Topic Software Development",
		# 	,
		# 	"Topic Photoshop",
		# 	"Topic Mobile development"
		# ]

		# topics_desc_arr.each do |desc|
		# 	Topic.create!(desc: desc)
		# end

		topics_hash = {
			1 => ["Web Development",
				"Topic Web Development"],
				2 => ["Web Design",
					"Topic Web Design"],
					3 => ["Software Development",
						"Topic Software Development"],
						4 => ["Business",
							"Topic Business"],
							5 => ["Photoshop",
								"Topic Photoshop"],
								6 => ["Mobile development",
									"Topic Mobile development"
									]}

									topics_hash.each do |key, array|
										Topic.create!(
											name: array[0],
											desc: array[1],
										)
											end




		# Group categories for tutorials
		groups_arr = ["Web Development", 
			"Web Design", 
			"Software Development",
			"Business",
			"Photoshop",
			"Mobile development"
		]
		
		groups_arr.each do |group|
			Group.create!(name: group)
		end

		# Tag categories for Blogs
		tags_arr = ["Web Development", 
			"Web Design", 
			"Software Development",
			"Business",
			"Photoshop",
			"Mobile development"
		]
		
		tags_arr.each do |tag|
			Tag.create!(name: tag)
		end


		courses_hash = {
			1 => ["SQL Essentials", #Title
			 	Faker::Name.name, #Author
			 	1, #user_id
			 	0, #ispublished
			 	"January", #ReleaseMonth
			 	[1,3], #Category
			 	"sqlessentials.png", #image
			 	"Have you been wanting to learn SQL, but have not start yet? Or, maybe you know some SQL, but you need a better understanding of it. Either way, this course is just right for you. Andrew Burgess is teaching on the basic use of SQL with MySQL server and using it from PHP. So, let's get started!"
			 	],
			 2 => ["Organizing Testable Backbone and Require.js Applications", #Title
			 	Faker::Name.name, #Author
			 	2, #user_id
			 	1, #ispublished
			 	"January", #ReleaseMonth
			 	[1,3], #Category
			 	"organizing.jpg", #image
			 	"So you have learned a bit about JavaScript testing, and are now ready to begin testing your Backbone apps. The only problem is that your team uses Require.js to organize and load your scripts. This can make your modules considerably more difficult to test. In this screencast, I will break everything down. In addition to Backbone and Require.js, we will be using Jam to load our dependencies, and Testem, which provides an easy interface to perform automated tests (using Jasmine). Finally, we will create a minimal build script."
			 	],
			 3 => ["Programming Windows in .NET", #Title
			 	Faker::Name.name, #Author
			 	3, #user_id
			 	1, #ispublished
			 	"January", #ReleaseMonth
			 	[3], #Category
			 	"progWNet.png", #image
			 	"Have you ever wanted to learn to make Windows programs using the .NET Library? Well, Jeremy is here to teach us how to do it. Come and join the fun!"
			 	],
			 4 => ["Less is More", #Title
			 	Faker::Name.name, #Author
			 	1, #user_id
			 	1, #ispublished
			 	"January", #ReleaseMonth
			 	[1,3], #Category
			 	"less-is-more.jpg", #image
			 	"In this course, I will show you all of the cool features that the LESS CSS preprocessor provides, in order to make writing CSS more awesome! You will learn all the ins and outs, including variables, nesting, Math and color functions, namespacing, and the various forms of mixins. In no time, you will master the syntax!"
			 	],
			 5 => ["Riding Ruby on Rails", #Title
			 	Faker::Name.name, #Author
			 	5, #user_id
			 	0, #ispublished
			 	"January", #ReleaseMonth
			 	[1,3], #Category
			 	"RidingRuby100x100.png", #image
			 	"Been meaning to learn Ruby on Rails, but felt that it was too hard? Well, not anymore. In this course, Jose Mota will take you through the process of creating dynamic and creative web applications, using Ruby on Rails. Come join us for the ride!"
			 	],
			 6 => ["Build Web Apps in Node and Express", #Title
			 	Faker::Name.name, #Author
			 	1, #user_id
			 	1, #ispublished
			 	"January", #ReleaseMonth
			 	[2], #Category
			 	"nodejs.jpg", #image
			 	"Node.js is the JavaScript engine for Chrome, moved to the command line for use as a general programming language. In this course, you will learn how to make use this engine to build web applications with ease."
			 	],
			 7 => ["jQuery Plugin Development: Best Practices", #Title
			 	Faker::Name.name, #Author
			 	1, #user_id
			 	1, #ispublished
			 	"January", #ReleaseMonth
			 	[1,2,3], #Category
			 	"jquery.jpg", #image
			 	"This course will explain the fundamental aspects of writing great jQuery plugins. Some of the topics we will cover include how plugins extend jQuery is prototype to add new methods to the library, understanding the this object inside a plugin, keeping plugins configurable, theming them, handling events and exposing AJAX options for easier implementation by others. Sound fun?"
			 	],
			 8 => ["Perfect Workflow in Sublime Text 2", #Title
			 	Faker::Name.name, #Author
			 	2, #user_id
			 	0, #ispublished
			 	"March", #ReleaseMonth
			 	[1], #Category
			 	"sublime.jpg", #image
			 	"Welcome! In this course, we are going to take the knowledge that you have gained from coding for the browser, and apply it to the server environment. Over the next fifteen lessons, we will start from the beginning, get Node installed and running, and then move on to more complex projects that will explore the basics tools and functionality that the Node.js platform has to offer."
			 	],
			 9 => ["An Introduction to Node.js", #Title
			 	Faker::Name.name, #Author
			 	3, #user_id
			 	1, #ispublished
			 	"January", #ReleaseMonth
			 	[1,2], #Category
			 	"nodejs.jpg", #image
			 	"I am a confessed code editor addict, and have tried them all! I was an early adopter of Coda, a TextMate advocate, even a Vim convert. But all of that changed when I discovered Sublime Text 2, the best code editor available today. Do not believe me? Let me convince you in this course."
			 	],
			 10 => ["Programming .NET", #Title
			 	Faker::Name.name, #Author
			 	5, #user_id
			 	1, #ispublished
			 	"January", #ReleaseMonth
			 	[3], #Category #Category
			 	"100-netprogramming.png", #image
			 	"For over ten years, Microsoft's .NET Framework has been the platform to develop for if you want to target Windows or Windows-based technologies. Getting started with the .NET Framework can be a daunting task, as the .NET Framework class library is pretty darn big. But, thankfully, there are a core set of classes that you can use in any Windows or Web app. In this course, we will take a look at these classes and how we can use them in our code."
			 ]


			}

			count=0
			courses_hash.each do |key, array|
				Course.create!(title: array[0],
					author: array[1],
					user_id: array[2],
					ispublished: array[3],
					releasemonth: array[4],
			# 5 is category/topic
			image: array[6],
			desc: array[7])
				count=count+1
				array[5].each do |topicId| 
					Relationship.create!(course_id: count,topic_id: topicId)
				end
			end




		#Tutorials test data
		tutorials_hash = {
			1 => ["Connected to the Backbone", #Title
			 	Faker::Name.name, #Author
			 	"Medium", #difficulty
			 	60, #time in minutes
			 	1, #user_id
			 	1, #ispublished
			 	"January", #ReleaseMonth
			 	[1,3], #Category
			 	"tutorials/backbone.png", #image
			 	"Here's the thing: if you can't fathom why you'd need a framework like Backbone, then chances are, you don't! Perhaps you're exclusively working on simple websites or basic WordPress themes; in these cases, a structured JavaScript framework will likely be overkill.
			 	However, there will surely come a day when you realize that all of that spaghetti code within script tags at the bottom of your page has suddenly become unmanageable. Not only that, but, due to the way you structured your code, it's also impossible to test. Gasp! What to do?"
			 	],
			2 => ["The Power of Laravel Generators", #Title
			 	Faker::Name.name, #Author
			 	"Easy", #difficulty
			 	30, #time in minutes
			 	2, #user_id
			 	1, #ispublished
			 	"January", #ReleaseMonth
			 	[1], #Category
			 	"tutorials/laravel-generators.jpg", #image
			 	"Those of us who use Laravel on a daily basis will be quite familiar with migrations. The only problem is that, when we run php artisan migration:make, only a bit of boilerplate code is generated for us. Wouldn't it be amazing if we could also generate the schema for both the up and down functions? How much time would that save!?"
			 	],
			3 => ["Develop Your First Game in Canvas From Start to Finish", #Title
			 	Faker::Name.name, #Author
			 	"Hard", #difficulty
			 	100, #time in minutes
			 	1, #user_id
			 	0, #ispublished
			 	"May", #ReleaseMonth
			 	[1,4], #Category
			 	"tutorials/develop-game-in-canvas.jpg", #image
			 	"Whether you're taking part in the discussion, or reading articles about it, you must be aware that, even though it's still a specification, HTML5 is ready to be used right now."
			 	],
			4 => ["A Visual Guide to Styling the Terminal in Minutes", #Title
			 	Faker::Name.name, #Author
			 	"Easy", #difficulty
			 	30, #time in minutes
			 	3, #user_id
			 	1, #ispublished
			 	"May", #ReleaseMonth
			 	[1,2], #Category
			 	"tutorials/styling-terminal.jpg", #image
			 	"One of the questions that I am asked about most frequently relates to how I styled my Terminal. In this video, I encourage you to follow along with me, as we get everything setup from scratch."
			 	],
			5 => ["PHP Tips and Tricks", #Title
			 	Faker::Name.name, #Author
			 	"Medium", #difficulty
			 	60, #time in minutes
			 	5, #user_id
			 	1, #ispublished
			 	"January", #ReleaseMonth
			 	[2], #Category
			 	"tutorials/php.jpg", #image
			 	"Let's target the elephant in the room: PHP has been on the receiving end of a considerable amount of flack in the last few years. Well, who are we kidding? It's always served as the punching bag for the cool kids! But there's just one thing; despite all of this ridicule, PHP continues, with ease, to remain infinitely more popular than its server-side competitors in terms of users."
			 	],
			6 => ["Realtime Backbone.js Apps with FuelPHP and Pusher", #Title
			 	Faker::Name.name, #Author
			 	"Hard", #difficulty
			 	90, #time in minutes
			 	1, #user_id
			 	0, #ispublished
			 	"December", #ReleaseMonth
			 	[2,3], #Category
			 	"tutorials/backbone-and-pusher.png", #image
			 	"Today we're going to create a small realtime web application with FuelPHP on the server, Backbone.js on the client and using the Pusher API for the realtime aspects. The application we'll be building is a modern take on my classic Shoutbox PHP demo application I originally wrote six years ago here on SmartCoach, and covered again not long after in Ruby on Rails."
			 	],
			7 => ["Front-end Performance Optimization: What, Why and How?", #Title
			 	Faker::Name.name, #Author
			 	"Hard", #difficulty
			 	90, #time in minutes
			 	1, #user_id
			 	0, #ispublished
			 	"May", #ReleaseMonth
			 	[1,2], #Category
			 	"tutorials/front-end-performance.jpg", #image
			 	"Believe it or not, the concept of optimizing front-end code for maximum performance is a relatively new thing. Sure, years and years ago, we knew that it was important, but we simply didn't have access to the tools that we do today. Even six years ago, we were far more concerned with wrangling our websites into functioning correctly in Internet Explorer 6 than with squeezing every ounce of performance out of our applications."
			 	],
			8 => ["The Essentials of AMD and RequireJS", #Title
			 	Faker::Name.name, #Author
			 	"Easy", #difficulty
			 	30, #time in minutes
			 	2, #user_id
			 	1, #ispublished
			 	"May", #ReleaseMonth
			 	[1,7], #Category
			 	"tutorials/preview.jpg", #image
			 	"In this screencast, we'll review RequireJS, an asynchronous module loader and dependency manager, and AMD, which defines the mechanism and guidelines for declaring and importing modules."
			 	],
			9 => ["Techniques For Test-Driving jQuery Plugins", #Title
			 	Faker::Name.name, #Author
			 	"Hard", #difficulty
			 	90, #time in minutes
			 	9, #user_id
			 	1, #ispublished
			 	"May", #ReleaseMonth
			 	[5,3], #Category
			 	"tutorials/techniques-for-test-driving-plugins1.jpg", #image
			 	"In this hands-on screencast, from scratch, we will use test-driven development to build a jQuery plugin. Along the way, we'll take advantage of Grunt, QUnit, and GitHub to build, test, and distribute our plugin, respectively. If the idea of testing in JavaScript is still foreign to you, you won't find a better introduction!"
			 	],
			10 => ["How To Customize Your Terminal", #Title
			 	Faker::Name.name, #Author
			 	"Medium", #difficulty
			 	60, #time in minutes
			 	3, #user_id
			 	1, #ispublished
			 	"May", #ReleaseMonth
			 	[1,3], #Category
			 	"tutorials/how-to-customize-your-command-prompt.png", #image
			 	"Lately, I've been getting this question a lot: how did you get your terminal to look the way it does? If you've noticed my terminal and are curious about how I set it up, this is the tutorial for you! Of course, what you learn here will be enough to get you started on creating your own custom command prompt, as well!"
			 ]


			}

			count=0
			tutorials_hash.each do |key, array|
				Tutorial.create!(title: array[0],
					author: array[1],
					difficulty: array[2],
					estimated_time: array[3],
					user_id: array[4],
					ispublished: array[5],
					releasemonth: array[6],
			# 7 is category/topic
			image: array[8],
			desc: array[9])
				count=count+1
				array[7].each do |groupId|
					Grouping.create!(tutorial_id: count,group_id: groupId)
				end
			end


		#Blogs test Data
		blogs_hash = {
			1 => ["The Design Student Dilemma: Clients or Classes?", #Title
			 	Faker::Name.name, #Author
			 	1, #user_id
			 	1, #ispublished
			 	"January", #ReleaseMonth
			 	[1,3], #Category
			 	"blogs/2757851927_838e959e76_z.jpg", #image
			 	"This week's post is brought to us by Philip Zeplin. Philip teaches photo retouching and manipulation here at SmartCoach Premium and is also a successful author on the Envato marketplaces. Being a recent graduate himself, Philip weighs in on one of the most common questions facing students interested in design: to pursue college or jump into work?
			 	So you are a young new fresh student, perhaps straight out of high school. You have decided you want to become a designer. Congratulations! You have chosen a fantastic field. But what you should do? Should you go straight to working, apply for an internship, or study?
			 		When asking that question, you'll get a lot of very different answers, and in the end, the frustratingly true answer is probably !it depends."
			 		],
			2 => ["Common Screencasting 'Techniques' That Drive Me Nuts", #Title
			 	Faker::Name.name, #Author
			 	3, #user_id
			 	0, #ispublished
			 	"January", #ReleaseMonth
			 	[1,5], #Category
			 	"blogs/screencasting-techniques.jpg", #image
			 	"What may not be immediately obvious is that, in addition to creating screencasts for SmartCoach, I'm also a huge fan of the opposite: watching them! When I was first getting started in this industry, they provided the connection that I was missing. Books are a necessity, but we still often need the human aspect of learning. And that's what we've tried to achieve on this site: be the person sitting next to you, explaining confusing stuff.
			 	After all those years, I've certainly come across (and experimented with, myself) screencasts that unfortunately fall short. Luckily, these short-comings are fixable!"
			 	],
			3 => ["5 Fun iPhone Apps to help get your Creative Juices Flowing", #Title
			 	Faker::Name.name, #Author
			 	5, #user_id
			 	1, #ispublished
			 	"January", #ReleaseMonth
			 	[5,4], #Category
			 	"blogs/photodune-2074124-girl-with-mobile-smart-phone-m.jpg", #image
			 	"For those of us in the creative industry, almost anything and everything we come across and see, hear, taste and feel can be used as a source of inspiration for our work.
			 	But there are also times when we go blank and have a creative block. For those moments, there are some nifty little iPhone apps which can help in getting those creative juices flowing again, so here are five which I think are both fun and worth looking at:"
			 	],
			4 => ["Mottos to Design By", #Title
			 	Faker::Name.name, #Author
			 	1, #user_id
			 	1, #ispublished
			 	"January", #ReleaseMonth
			 	[5,4], #Category
			 	"blogs/6891240539_564ffa808c_z.jpg", #image
			 	"Keeping the creative juices flowing, embracing change and increasing our skills are all challenges we face as designers. Sometimes we need a different source of inspiration that lets us know to color outside the lines, cause a scene, make waves and get carried away every now and then.
			 	I have a painting in my office with those statements that inspire me when I need it most. It could be two in the morning and I've hit a creative road block, or a new opportunity landed in my inbox and I'm just not sure how to move forward. A look at these statements is usually enough to inspire me to overcome the many challenges I face every day and nurture the endless possibilities that may come up."
			 	],
			5 => ["The Pros and Cons of Self-Publishing", #Title
			 	Faker::Name.name, #Author
			 	3, #user_id
			 	1, #ispublished
			 	"January", #ReleaseMonth
			 	[5,4], #Category
			 	"blogs/2549674296_25f954288f_z.jpeg", #image
			 	"As the manager of Rockable Press, I constantly receive book proposals from aspiring authors around the world, and if we can't take their book proposal on-board, I always encourage them to consider the option of self-publishing the book themselves.
			 	I'm a huge fan of self-publishing, and though this may seem strange coming from someone who runs the publishing arm of a company, I think there's a lot to be said for it."
			 	],
			6 => ["Job Opening: We're Looking for a Web Design Producer", #Title
			 	Faker::Name.name, #Author
			 	4, #user_id
			 	1, #ispublished
			 	"January", #ReleaseMonth
			 	[5,4], #Category
			 	"blogs/3713625765_335b6c5af0_z.jpeg", #image
			 	"We are looking for a passionate web designer to work with a team of instructors (you'll build your own team) and lead them in producing a handful of awesome web design video courses each month."
			 	],
			7 => ["Member Workshop: What Are You Learning?", #Title
			 	Faker::Name.name, #Author
			 	8, #user_id
			 	1, #ispublished
			 	"January", #ReleaseMonth
			 	[5,4], #Category
			 	"blogs/3414888284_64a3ae6650_z.jpg", #image
			 	"Practice does, indeed, make perfect. At the end of a lesson here on SmartCoach Premium, instructors frequently will encourage you to practice, try out what they just demonstrated, do something, make something! Those aren't just platitudes: you really do have to do it. Any skill, regardless of the education and knowledge received, takes hands-on execution and experimentation. Passively watching even the best course video will only take you so far. Just like watching a cooking show on television won't necessarily make you a professional chef. It takes practice. That's why schools assign homework and have workshops and labs."
			 ]

			 
			}

			count=0
			blogs_hash.each do |key, array|
				Blog.create!(title: array[0],
					author: array[1],
					user_id: array[2],
					ispublished: array[3],
					releasemonth: array[4],
			# 5 is category/topic
			image: array[6],
			content: array[7])
				count=count+1
				array[5].each do |tagId| 
					Tagging.create!(blog_id: count,tag_id: tagId)
				end
			end


			

			


		# courses = Course.all
		# courses.each do |course|
		# 	Relationship.create!(course_id: course.id,
		# 						 topic_id: 1
		# 							)
		# 	Relationship.create!(course_id: course.id,
		# 						 topic_id: 3
		# 							)
		# end





		
		# 10.times do |n|
		# 	name = Faker::Name.name
		# 	email = "example-#{n+1}@railstutorial.org"
		# 	password = "password"
		# 	User.create!(name: name,
		# 	email: email,
		# 	password: password,
		# 	password_confirmation: password)
		# end

		
		# 10.times do |n|

		# 	title = "Example Title #{n+1}"
		# 	author = Faker::Name.name
		# 	category = "Example Category #{n+1}"
		# 	image = "Example Image Path #{n+1}"
		# 	desc = "Example Description #{n+1}"
		# 	Course.create!(title: title,
		# 		author: author,
		# 		category: category,
		# 		image: image,
		# 		desc: desc)
		# end
		# admin = User.first
		# admin.toggle!(:admin)

		# users = User.all(limit: 6)
		# 50.times do
		# 	content = Faker::Lorem.sentence(5)
		# 	users.each { |user| user.microposts.create!(content: content) }
		# end


		# users = User.all
		# user = users.first
		# followed_users = users[2..50]
		# followers 	   = users[3..40]
		# followed_users.each { |followed| user.follow!(followed) }
		# followers.each 	    { |follower| follower.follow!(user) }


	end
end
