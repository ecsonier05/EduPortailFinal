import React from 'react';
import { Text } from 'react-native';
import { useRoute } from "@react-navigation/native";

function PerfInfoScreen(props) {

    const route = useRoute();
    const id = route.params?.id;
    const mode = route.params?.mode;

    return (
        <Text>{id} {mode}</Text>
    );
}

export default PerfInfoScreen;