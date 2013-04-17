module LmsHelper

		def lms_enable?
				Settings.lms.enable
		end

		def lms_course_url(lms_id)
				"#{Settings.lms.root_url}#{Settings.lms.course_url_path}#{lms_id}"
		end

		def lms_create_user(current_user)
				if lms_enable? and current_user != nil
						lmsuser=CanvasREST::User.new
						lmsuser.set_token(Settings.lms.oauth_token,Settings.lms.api_root_url)
						u=lmsuser.create_user(Settings.lms.account_id,current_user.name,current_user.email,current_user.password)
						current_user.update_attributes(:lms_id => u["id"])
				end
		end

		def lms_create_course(course)
				if lms_enable? 
						lmscourse=CanvasREST::Course.new
						lmscourse.set_token(Settings.lms.oauth_token,Settings.lms.api_root_url)
						c=lmscourse.create_course(Settings.lms.account_id,course.id,course.title,course.desc)
						@course.update_attributes(:lms_id => c["id"])
				end
		end

		def lms_update_course(course)
				if lms_enable? 
						lmscourse=CanvasREST::Course.new
						lmscourse.set_token(Settings.lms.oauth_token,Settings.lms.api_root_url)
						lmscourse.update_course(course.lms_id,course.title,course.desc)
				end
		end

		def lms_delete_course(lms_id)
				if lms_enable? 
						lmscourse=CanvasREST::Course.new
						lmscourse.set_token(Settings.lms.oauth_token,Settings.lms.api_root_url)
						lmscourse.delete_course(lms_id)
				end
		end

		def lms_get_modules(course)
				modules=[]
				if lms_enable? 
						lmscourse=CanvasREST::Course.new
						lmscourse.set_token(Settings.lms.oauth_token,Settings.lms.api_root_url)
						course=lmscourse.get_course(course.lms_id)
						modules=course.modules
				else
						modules
				end
		end


end