# icp-electronic-toll-collection

Problem

In order for a TAG device to be accepted on a highway, tunnel or bridge affiliated with interoperability, the operators have the task of exchanging data among themselves of any transaction registered in their Electronic Toll infrastructure, with the primary purpose of having an updated global pattern of TAGs.

The current interoperability process is carried out through the use of SFTP servers, in which each Electronic Toll operator deposits the tolls associated with any TAG, with XML being the standard format for exchanging information used between them.

It has been observed that the Electronic Toll operators have manual and, in the best of cases, semi-automated mechanisms to exchange transaction data from both their own and third-party TAGs. The current solution has drawbacks in the data collection and delivery processes, the following being the most relevant:

1.- Loss of communication when exchanging obtaining the XML file, that is, the information may not be completely obtained, since there may be data losses during the transmission of the file.

2.- Review the SFTP server from time to time, it can generate that the allowed number of asynchronous sockets can remain in "TIME WAIT" status, adding said status to the number of sockets allowed by server and user with "ESTABLISHED" status, said behaviors without importing the operating system, Windows or Llinux, which are governed by POSIX, can lead to loss of access to SFTP servers, putting at risk the integrity of the TAGs in terms of their status and/or available balance.

3.- The information could be modified directly in the SFTP servers, by both internal and external attacks, this being a problem when carrying out the toll reconciliation processes, with totally incongruous figures, generating a waste of time and money when generating the tolls. collection invoices for both operators and end customers

The current scenario, in which consumers are increasingly demanding about the quality of the services they demand, forces us to implement alternatives different from how the data is processed. An ideal mechanism is the use of disruptive technologies that can put the Electronic Toll sector in ideal circumstances of connectivity and avant-garde competitiveness.

Solution

Derived from the current technical situation, the development of an interface capable of being able to insert each of the crossings made at the toll booths through electronic tolls in a private blockchain network is proposed, where in the same way it can send data of control figures to a network. public; Once the previous steps have been carried out, you can immediately filter and determine which operator the toll belongs to, complying with the interoperability process, leaving SFTP servers out, and adapting a queuing system that can comply with fault tolerance.

In order to comply with transparency in the transactions carried out and if it is necessary to request information directly from the private network to reconcile information that the regulatory entity may question, where the private blockchain will be its main source of information, NEAR blockchain will be used. public for the issuance of delivery document receipt of requested information, generating document as NFT, and can be used as unique proof, using IPFS as a file storage system, where in the same way the integrity of the generated document can be counted on.

With the foregoing, the acquisition of the ICP Token by the client is determined to carry out requests to extract information directly from the private blockchain, said fee will be to meet transaction expenses for the creation of receipt delivery receipt; a web portal will be created where the transfer of funds can be made, which will be able to interact with the smart contract developed in ICP.

Once the transfer of funds for the acquisition of information from the company/operator, a temporary channel will be created that will expose the corresponding information of the applicant, said information extracted from the private blockchain network.

Continuing with the flow of information transparency, said funds transferred through the NEAR token will continue to be transparent for the client, since they will be in a public network, said protocol was selected, since the cost of transactions is lower. to others such as ETHEREUM, in addition to the use of the Proof Of Stake (PoS) protocol, making transactions per second (TPS) more agile and faster.

The cost in the transactions of transparency of control figures, may be assumed by the company that will regulate the electronic toll booths, these figures being uploaded in accordance with what is proposed by it, that is, on a weekly or monthly basis, for validation by the the managing companies.

The infrastructure of the private network will be carried out through the use of AWS, assembling HyperLedger BAF as a framework, making use of Fabric, BAF is contemplated derived from the entire automation environment created.

![INTER-OPERABILIDAD-WorkFlow_ ETC_ ICP - GATEWAY (4)](https://github.com/nikoturin/icp-electronic-toll-collection/blob/main/Administraci%C3%B3n-Proyecto/ETC-ICP-DESIGN.jpg)
