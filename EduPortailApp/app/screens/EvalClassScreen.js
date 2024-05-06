import React from 'react';
import { Text } from 'react-native';
import { useRoute } from "@react-navigation/native";

function EvalClassScreen(props) {
    const route = useRoute();
    const id = route.params?.id;

    return (
        <Text>{id}</Text>
    );
}

export default EvalClassScreen;