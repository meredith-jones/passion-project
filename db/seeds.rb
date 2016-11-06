paul = User.create(username: "paul123", email: "paul@paul.com", phone: "123-456-789", password: "123")
bob = User.create(username: "bob123", email: "bob@bob.com", phone: "310-456-789", password: "123")

paul.symptoms << Symptom.create(symptom_name: "headache", severity: 10, notes: "in the front of my head", user_id: 1)
bob.symptoms << Symptom.create(symptom_name: "back ache", severity: 5, notes: "lower back", user_id: 2)
paul.symptoms << Symptom.create(symptom_name: "fatigue", severity: 7, user_id: 1)
bob.symptoms << Symptom.create(symptom_name: "joint pain", severity: 8, notes: "mostly in my hands", user_id: 2)
