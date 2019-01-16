import { NativeModules, NativeEventEmitter, Dimensions } from "react-native";
const { RNSimpleCompass } = NativeModules;

let listener;

//Monkey patching
let _start = RNSimpleCompass.start;
RNSimpleCompass.start = (update_rate, callback) => {
  if (listener) {
    RNSimpleCompass.stop();
  }

  const compassEventEmitter = new NativeEventEmitter(RNSimpleCompass);
  listener = compassEventEmitter.addListener("HeadingUpdated", course => {
    const correctedCourse = { ...course };
    const { height, width } = Dimensions.get("window");
    if (width > height) correctedCourse.heading += 90;
    callback(correctedCourse);
  });

  _start(update_rate === null ? 0 : update_rate);
};

let _stop = RNSimpleCompass.stop;
RNSimpleCompass.stop = () => {
  listener && listener.remove();
  listener = null;
  _stop();
};

export default RNSimpleCompass;
