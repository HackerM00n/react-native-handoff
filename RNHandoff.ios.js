import React, { useEffect } from "react";
import { NativeModules } from "react-native";

const { RNHandoff } = NativeModules;

function generateRandomId() {
  return Math.floor(Math.random() * 9000000000) + 1000000000;
}

function Handoff({ type, title, url }) {
  useEffect(() => {
    const handoffId = generateRandomId();
    RNHandoff.becomeCurrent(handoffId, type, title, url);

    return () => {
      RNHandoff.invalidate(handoffId);
    };
  }, [type, title, url]);

  return null;
}

export default Handoff;
