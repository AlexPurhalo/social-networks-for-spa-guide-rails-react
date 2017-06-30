### Usage
	$ rake db:migrate
	$ cd client && npm install
	$ cd ../ && rake start

		
Updating user query example:		
```
mutation updateUser($access_token: String!) {
  updateUser(user: { id: "11", username: "Works?", access_token: $access_token }) {
    id
    username
  }
}

```		
