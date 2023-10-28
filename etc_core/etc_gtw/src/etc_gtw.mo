import Map "mo:base/HashMap";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import D "mo:base/Debug";
import DB "canister:etc_icp_db";
import DBOpe1 "canister:etc_icp_db_ope1";
import DBOpe2 "canister:etc_icp_db_ope2";
import DBOpe3 "canister:etc_icp_db_ope3";
import DBOpe4 "canister:etc_icp_db_ope4";

actor Gateway {

	public func etc_gateway(): async () {
		
		let capacity_list = await DB.list();
		//("3", {Ope = "OPE3"; Status = "N"; StrToll = "OPE3WWWXXXYYYZZZ"})		
		for (value in capacity_list.vals()){

			let GId: DB.Id = value.0;
			let GToll: DB.Toll = {

				Ope = value.1.Ope;
				StrToll = value.1.StrToll;
				Status = "T";				
			};

			if (Text.contains(value.1.StrToll, #text "OPE1") == true and Text.contains(value.1.Status, #text "N") == true){
				D.print("OPE1");
				await DBOpe1.insert(value);
				await DB.update(GId, GToll);
			}else if (Text.contains(value.1.StrToll, #text "OPE2") == true and Text.contains(value.1.Status, #text "N") == true){
				D.print("OPE2");
				await DBOpe2.insert(value);
				await DB.update(GId, GToll);
			}else if (Text.contains(value.1.StrToll, #text "OPE3") == true and Text.contains(value.1.Status, #text "N") == true){
				D.print("OPE3");
				await DBOpe3.insert(value);
				await DB.update(GId, GToll);
			}else if (Text.contains(value.1.StrToll, #text "OPE4") == true and Text.contains(value.1.Status, #text "N") == true){
				D.print("OPE4");
				await DBOpe4.insert(value);
				await DB.update(GId, GToll);
			};
		};
		//return "GateWay Done ...";
	};
};
