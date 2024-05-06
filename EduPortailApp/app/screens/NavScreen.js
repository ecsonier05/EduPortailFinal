import React from 'react';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import Icon from 'react-native-vector-icons/Ionicons';
import MainScreen from './MainScreen';
import EvalScreen from './EvalScreen';
import PerfScreen from './PerfScreen';
import ProfileScreen from './ProfileScreen';

const Tab = createBottomTabNavigator();

export default function NavScreen({ navigation }) {
    return (
        <Tab.Navigator 
            screenOptions={({route}) => ({
                tabBarIcon: ({focused, size}) => {
                    let iconName;
                    if (route.name === 'Accueil') {
                        iconName = focused ? 'menu' : 'menu-outline';
                    } else if (route.name === 'Évaluations'){ 
                        iconName = focused ? 'folder-open-sharp' : 'folder-outline';
                    } else if (route.name === 'Performance') { 
                        iconName = focused ? 'bar-chart' : 'bar-chart-outline';
                    } else if (route.name === 'Profil') {
                        iconName = focused ? 'person' : 'person-outline';
                    }
                    return <Icon name={iconName} size={size} />;
                },
                headerShown: false,
                tabBarLabelStyle: {
                    fontWeight: "bold",
                    fontSize: 15
                }
            })}
        >
            <Tab.Screen 
                name="Accueil" 
                component={MainScreen}
            />
            <Tab.Screen 
                name="Évaluations"
                component={EvalScreen}
            />
            <Tab.Screen 
                name="Performance"
                component={PerfScreen}
            />
            <Tab.Screen 
                name="Profil"
                component={ProfileScreen}
            />
        </Tab.Navigator>
    );
}