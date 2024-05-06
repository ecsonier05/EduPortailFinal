import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import {createNativeStackNavigator} from '@react-navigation/native-stack';

import NavScreen from './app/screens/NavScreen';
import LoginScreen from './app/screens/LoginScreen';
import CreateScreen from './app/screens/CreateScreen';
import ForgotPwScreen from './app/screens/ForgotPwScreen';

const Stack = createNativeStackNavigator();

export default function App() {
  return ( 
    <NavigationContainer>
      <Stack.Navigator initialRouteName='Login' screenOptions={{headerShown: false}}>
        <Stack.Screen name="Login" component={LoginScreen} />
        <Stack.Screen name="Nav" component={NavScreen} />
        <Stack.Screen name="Create" component={CreateScreen} options={{headerShown: true, headerTitle: 'Création de compte'}} />
        <Stack.Screen name="Forgot" component={ForgotPwScreen} options={{headerShown: true, headerTitle: 'Mot de passe oublié'}} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}

