json.id user_share.id
json.user_share_id user_share.user_share.id
json.user_share_name user_share.user_share.name
json.end_date user_share.end_date.strftime("%d/%m/%Y") unless user_share.end_date.blank?
json.user_id user_share.user.id
json.user_name user_share.user.name
json.medical_appointment user_share.medical_appointment
json.exam user_share.exam
json.treatment user_share.treatment
json.status user_share.status
