
import { NativeModules } from 'react-native';

const { RNSimpleCompass } = NativeModules;

//Monkey patching
let _start = RNSimpleCompass.start;
RNSimpleCompass.start = (params) => {
  _start(params ? params : {})
}

export default RNSimpleCompass;
