import React from 'react';
import { Text, View, StyleSheet } from 'react-native';
import { useRoute } from "@react-navigation/native";
import { BarChart, LineChart, PieChart, PopulationPyramid } from "react-native-gifted-charts";
import { RFPercentage, RFValue } from "react-native-responsive-fontsize";

export default function PerfInfoScreen(props) {

    const route = useRoute();
    const id = route.params?.id;
    const mode = route.params?.mode;

    let data = []

    if(mode == 'moy'){
        data=[ 
            {value: 75, label: 'PROG1296'},
            {value: 40, label: 'PROG1294'},
            {value: 90, label: 'PROG1341'},
            {value: 100, label: 'PROG1300'},
            {value: 65, label: 'SYST1037'}  
        ]
    } else {
        data=[ 
            {value: 50, label: 'Devoir 1'},
            {value: 80, label: 'Devoir 2'},
            {value: 5, label: 'Devoir 3'},
            {value: 70, label: 'Test 1'},
            {value: 100, label: 'Devoir 4'}  
        ]
    }

    return (
        <View>
            <Text style={styles.perfTitle}>Ma performance</Text>

            {mode == 'moy' ? (
                <View style={styles.container}>
                    <Text style={styles.sessionText}>Session H2023</Text>

                    <View style={styles.graphContainer}>
                        <BarChart 
                            data = {data}
                            maxValue = {100}
                            spacing = {35}
                        />
                    </View>

                    <View style={styles.moyCheckContainer}>
                        <Text style={styles.goalLabel}>Moyenne generale souhaitee: </Text>
                        <Text style={styles.goalText}>80%</Text>

                        <Text style={styles.currentLabel}>Moyenne generale obtenu(session H2023): </Text>
                        <Text style={styles.currentText}>85.72%</Text>
                    </View>
                </View>
            ) : (
                <View style={styles.container}>
                    <Text style={styles.sessionText}>Session H2023</Text>

                    <View style={styles.graphContainer}>
                        <BarChart 
                            data = {data}
                            maxValue = {100}
                            spacing = {35}
                        />
                    </View>

                    <View style={styles.progressContainer}>
                        <View style={styles.progressBarShell} />
                        <View style={styles.progressBar} />
                    </View>

                    <View style={styles.pondMoyContainer}>
                        <View style={styles.boxPond}>
                            <PieChart 
                                data = {data} 
                                radius={80}
                            />
                        </View>
                        <View style={styles.boxMoyenne}>
                            <Text style={styles.contTitle}>Moyenne generale</Text>
                            <View style={styles.boxMoyInfo}>
                                <View style={styles.moyGenerale}>
                                    <Text style={styles.moyPour}>96.49%</Text>
                                </View>
                                <Text style={{fontWeight: 'bold'}}>Votre objectif:</Text>
                                <Text>80%</Text>

                                <Text style={{fontWeight: 'bold'}}>Note de passage</Text>
                                <Text>60%</Text>
                            </View>
                        </View>
                    </View>

                </View>
            )}
        </View>
    );
}

const styles = StyleSheet.create({
    perfTitle: {
        position: 'absolute',
        top: 5,
        left: '30%',
        fontSize: 30
    },
    container: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'flex-end',
    },
    sessionText:{
        position: 'absolute',
        top: 45,
        fontSize: 20,
        fontWeight: 'bold'
    },
    graphContainer: {
        position: 'absolute',
        top: 70
    },
    //For Moyenne Screen
    moyCheckContainer: {
        backgroundColor: '#B0B0B0',
        position: 'absolute',
        top: 350,
        width: '90%',
        height: 300,
        alignItems: 'center',
    },
    goalLabel: {
        fontSize: 20,
        fontWeight: 'bold',
        marginTop: 20
    },
    goalText: {
        fontSize: 30,
    },
    currentLabel: {
        fontSize: 20,
        fontWeight: 'bold',
        marginTop: 10
    },
    currentText: {
        fontSize: 30,
        color: 'lime',
    },
    //For Grade Screen
    progressContainer: {
        backgroundColor: '#B0B0B0',
        position: 'absolute',
        top: 350,
        width: '90%',
        height: 100,
        alignItems: 'center',
        justifyContent: 'center'
    },
    progressBarShell: {
        backgroundColor: 'white',
        borderRadius: 5,
        borderWidth: 2,
        borderColor: 'black',
        width: '90%',
        height: 30,
        position: 'absolute'
    },
    progressBar: {
        backgroundColor: 'blue',
        borderRadius: 5,
        borderWidth: 2,
        borderColor: 'blue',
        width: 150,
        height: 30,
        position: 'absolute',
        left: 20
    },
    //Ponderation
    pondMoyContainer: {
        width: '90%',
        height: 225,
        position: 'absolute',
        top: 500,
        flexDirection: 'row',
        justifyContent: 'center',
    },
    boxPond: {
        backgroundColor: '#adcbe3',
        width: '47%',
        marginRight: '6%',
        borderRadius: 5,
        justifyContent: 'center',
        alignItems: 'center'
    },
    //Moyenne
    contTitle: {
        textAlign: 'center',
        fontSize: 20,
    },
    boxMoyInfo: {
        flexDirection: 'column',
        alignItems: 'center'
    },
    moyGenerale: {
        backgroundColor: '#7ac25a',
        width: 100,
        height: 100,
        borderRadius: 50,
        alignItems: 'center',
        justifyContent: 'center',
        marginVertical: 10
    },
    boxMoyenne: {
        backgroundColor: '#adcbe3',
        width: '47%',
        borderRadius: 5,
    },
    moyPour: {
        fontWeight: 'bold',
        fontSize: RFValue(16),
        color: 'white'
    }
})