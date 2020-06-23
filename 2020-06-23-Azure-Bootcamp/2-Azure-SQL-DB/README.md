This is an introduction to Azure SQL Database as a fully managed database service on Azure.

Azure SQL Database provides you with several deployment options to meet your workload needs. It’s the same SQL engine for all these options. 

1) Each standalone database is assigned a certain amount of resources via performance tiers: Basic, Standard, and Premium. The emphasis of this offering focuses on a simplified database-scoped programming model and applications with a predictable pattern and relatively stable workload. 

2) An elastic database pool is a shared resource model that enables higher resource utilization efficiency, and all the databases within an elastic pool share predefined resources within the same pool. The emphasis of this offering is on a simplified database-scoped programming model for multi-tenant SaaS apps.  The workload pattern is well-defined and is highly cost-effective in multi-tenant scenarios.  For ISVs with SaaS apps, the savings can be significant, in the hundreds of thousands of dollars or more.

3) A SQL Database Managed Instance offers a simplified instance-scoped programming model that is like an on-premises SQL Server instance. The databases in a SQL Database Managed Instance share the resources allocated to the Managed Instance, and the Managed Instance also represents the management grouping for these databases. The emphasis of this offering is on high compatibility with the programming model of an on-premises SQL Server and out-of-box support for a large majority of SQL Server features and accompanying tools/services. 

We will demonstrate Data Migration Assistant for assessing and migrating SQL Server to Azure SQL Database.
