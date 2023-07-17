# rackspace-interview

############

 

MPCSE Pre Interview Candidate Task

 

Base Requirements:  

Develop solution using Python 3.x
Use a 1.x release of terraform
Solution should be saved as a repository on GitHub.com .  If you prefer, you can share a zipped copy of the repo.
 

Task

 

Write a Lambda function that when invoked calls  [1] . See [2] for documentation. From the returned result, the payload should be processed and return a dictionary that maps

The users’ eye colors to a count of each eye color.  Also note that _ALL_ users should be processed.

 

e.g.

{ 

  ‘Gray’: 20,  # the count users that had Gray eyes

  ‘Brown: 5,

   …

}

 

Your solution should also include terraform code to package and deploy the

Lambda code into AWS

 

 

Bonus Task

 

Put the Lambda Function behind an AWS API gateway that would support the GET method and would return the same result as if you invoked the lambda function directly. This should also be codified in the repo as part of the terraform config.

 

 

** this solution should not require using AWS lambda beyond the free tier

 if you plan to deploy and test in an AWS Account.  Also, if you do not currently

 have an AWS account consider using opening a free tier account as noted here [3].

 

Partial solutions will be accepted.  Please note, your provided solution may be a topic of discussion in the interview.

 

If anything is unclear, please feel free to reach out for clarification.

 

[1] https://dummyjson.com/users

[2] https://dummyjson.com/docs

[3] https://aws.amazon.com/free

