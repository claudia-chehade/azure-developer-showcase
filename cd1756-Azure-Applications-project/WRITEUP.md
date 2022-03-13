# Architecture Decision Virtual Machiches versus App Services

# Costs 
Virtual Machine
- from $0,0052/Stunde for 0,5GB RAM and 4GB temporary storage (Bs-Serie) upto $99,15/hour for 12 TB RAM (416 vCPUs) (Mv2-Series) for high performance computing, 
- no limitations in RAM size and number of vCPUs
- more expensive
- Source: https://azure.microsoft.com/de-de/pricing/details/virtual-machines/linux/

App Service
- ideal for small applications without high performance requirements
- costs depends on required computing power starting with $0,013$/hour (Shared D1) hour for 1GB RAM and 1GB disk space, which can be upgraded upto $1,396/hour (Premium V3 P3v3) for 32GB RAM and 25GB disk space (8vCPUs)
- for the applications with security requirements costs ranges between $0,30/Stunde for 3,5GB RAM and 1TB disk space (1vCPU) upto $2,324/Stunde for 31GB RAM and 1TB disk space (8vCPUs)
- payment models per usages are around 50% till 100% more expensive compared to fixed prices models payed conianuously across a year or two
- Source: https://azure.microsoft.com/de-de/pricing/details/app-service/windows/

Conclusion: Virtual machines generates more costs in average than application services. Nevertheless for small applications with little required RAM and disk storage both options are possible from the price perspective.

# Scalability
Virtual Machine
- ideal for certain average load with higher peeks in usage

App Service
- constant loads with less flexibility to balance high peeks

Conclusion: For constant usage load application services are better suited, for peeks in usage virtual machines should be considered.

# Availability
Virtual Machine
- combinations of RAM, disk storage and cernels can be fine tuned as per the concerete need of the application 
- more control of the underlying system and more freedom to install whatever is needed

App Service
- support of a fixed set of combinations of RAM, disk storage and cernels
- support for a fixed set of languages

Conclusion: For standard web applications app services are sufficient, for larger and more computing intense application virtual machines can be fitted much better to the requirement profile of a certain application.

# Workflow
Virtual Machine
- more effort for set up and maintainance
- team with development and dev ops skills required

App Service
- team with minimal dev ops support
  
Conclusion: For small teams with a lack of dev ops skills application services are much better suited than virtual machines.

# Chosen solution: Application Services
I have chosen the application service solution before the virtual machine:
- since we have a lightweight application which is not performing any time consuming operation
- we are not expecting a lot of users at the beginning
- costs matters since there is only one developer doing work
- its written in the standard language Python, which is supported by app services
- we do not need to shield our application from outside since we do not have any special security requirements due do sensitive content


# Future prospects
If in the future more users might use the application, espcially if there are a lot of concurrent users we might consider switiching to virtual machines.
If our customers has more strict security requirements we would overthink the decision against virtaul machines.


