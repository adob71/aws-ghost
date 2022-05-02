# ASSIGNMENT FOR THE TECHNICAL INTERVIEW

# CLOUD ARCHITECT


## READ ME BEFORE STARTING

You have received this assessment as part of the interviewprocess at Nordcloud. In sending
this to candidates we are testing a few skills includingthe following:

```
● Architecture design
● Ability to present solutions
● Engineering skills
● Documentation
● Security
```
**A few notes:** Please try to deliver the best solutionyou can, given the time that you have
available. Concentrate on the components that youthink matter most.If there are any parts
of this assessment that are not clear, please do nothesitate to reach out to us for
clarification.

Study the assignment, create your own implementationand prepare to demo/explain it in the
interview. The goal is not to develop an exhaustiveand perfect solution with all the bells and
whistles, but to reflect your experience and approachto this assignment. However, it does
need to fulfill the acceptance criteria. Please alsokeep the “Business Case” in mind while
designing your solution.

Good luck!
Recruitment & Tech Interviewers


## Deliverables

- The solution must be delivered using a private git repository on GitHub or GitLab. Make
    sure to add the user @nc-tech-review as a collaboratorto the repository.
- All the code related to your implementation, in aform that is deployable by the
    interviewer.
- Comprehensive and understandable documentation ofyour solution.
- Presentation of your solution during the followingtechnical interview.

## Acceptance Criteria for the Implementation

- The application should be able to scale dependingon the load.
- There should be no obvious security flaws.
- The application must return consistent results acrosssessions.
- The implementation should be built in a resilientmanner.
- Observability must be taken into account when implementingthe solution.
- The deployment of the application and environmentshould be automated.


## Business Case

The customer Drone Shuttles Ltd. is currently runningtheir website on an outdated platform
hosted in their own datacenter. They are about tolaunch a new product that will revolutionize
the market and want to increase their social mediapresence with a blogging platform. During
their ongoing modernization process, they decidedthey want to use the Ghost Blog platform
for their marketing efforts.

They do not know what kind of traffic to expect sothe solution should be able to adapt to
traffic spikes. It is expected that during the newproduct launch or marketing campaigns there
could be increases of up to 4 times the typical load.It is crucial that the platform remains
online even in case of a significant geographicalfailure. The customer is also interested in
disaster recovery capabilities in case of a regionfailure.

As Ghost will be a crucial part of the marketing efforts,the customer plans to have 5 DevOps
teams working on the project. The teams want to beable to release new versions of the
application multiple times per day, without requiringany downtime. The customer wants to
have multiple separated environments to support theirdevelopment efforts.
As they are also tasked with maintaining the environmentthey need tools to support their
operations and help them with visualising and debuggingthe state of the environment..
The website will be exposed to the internet, thusthe security team also needs to have
visibility into the platform and its operations.Thecustomer has also asked for the ability to
delete all posts at once using a serverless function.

You are tasked to deliver a Proof of Concept for theirnew website. Your role is to design and
implement a solution architecture that covers thepreviously mentioned requirements, using
the major public cloud platform (AWS, GCP, Azure)that you’re interviewing for. The solution
should be optimised for costs and easy to maintain/developin the future.

Please implement your solution using the public cloudplatform that is mentioned in the
position that you applied for. E.g. if you appliedfor an AWS-role, your solution should also be
on AWS.


## Provided Resources

The Ghost platform and related documentation is availableonghost.org/docs. There are
multiple ways to install Ghost and they all have thesame functionality.

## Environment

You are expected to use your own environment/accountin the relevant cloud provider.
Nordcloud can’t provide you one. All major cloud providersdo offer some form of a free-tier. As
such it should be possible to complete the assignmentwithout incurring any serious costs.



