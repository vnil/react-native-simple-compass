declare module 'react-native-simple-compass' {
  export const start: (
    threshold: number,
    callback: (heading: number) => void,
  ) => Promise<boolean>;

  export const stop: () => void;
}