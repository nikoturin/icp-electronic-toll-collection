import Map "mo:base/HashMap";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";

// import Map "mo:base/RBTree", check it after ...

actor DBRepo {

     type Id = Text;
     type Toll = {

     	Ope: Text;
	StrToll: Text;
     	Status: Text;
   };

   let dataETC = Map.HashMap<Id, Toll>(0, Text.equal, Text.hash);

   public func insert(id : Id, toll : Toll): async () {
     dataETC.put(id, toll);
   };

   public query func lookup(id : Id): async ?Toll {
     dataETC.get(id);
   };
 
   public query func size(): async Nat {
     dataETC.size()
   };

   public query func list(): async [(Id,Toll)] {
	Iter.toArray(dataETC.entries())
   };

   // Will be necesary to check what is the exactly action replace made
   public func update (id: Id, toll: Toll): async () {
      ignore dataETC.replace(id, toll)
   };

   public func delete (id: Id): async () {
      dataETC.delete(id);
   };

   public func remove (id: Id): async ?Toll {
      dataETC.remove(id);
   };
};
