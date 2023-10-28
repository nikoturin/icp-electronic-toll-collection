import Map "mo:base/HashMap";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import { abs } = "mo:base/Int";
import { now } = "mo:base/Time";
import { setTimer; recurringTimer } = "mo:base/Timer";
import D "mo:base/Debug";
import Gtw "canister:etc_icp_gtw";

actor Jobs {

  let gtwJobSeconds = 15;

  private func etc_job() : async () {
    await Gtw.etc_gateway();
  };

 ignore setTimer(#seconds (gtwJobSeconds),
    func () : async () {
      ignore recurringTimer(#seconds gtwJobSeconds, etc_job);
      await etc_job();
  });
};
