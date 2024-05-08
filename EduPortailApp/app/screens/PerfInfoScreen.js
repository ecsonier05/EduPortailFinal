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
    let pond = []

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

        pond=[
            {value: 40, text: '40%', color: '#177AD5'}, //Exams
            {value: 25, text: '25%', color: '#79D2DE'}, //Tests
            {value: 35, text: '35%', color: '#ED6665'}, //Homework
        ]
    }

    return (
        <View style={styles.mainContainer}>
            <Text style={styles.perfTitle}>Ma performance</Text>

            {mode == 'moy' ? (
                <View style={styles.container}>
                    <Text style={styles.sessionText}>Session H2023</Text>

                    <View style={styles.graphContainer}>
                        <BarChart 
                            data = {data}
                            maxValue = {100}
                            spacing = {35}
                            frontColor={'#4b86b4'}
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
                            frontColor={'#4b86b4'}
                        />
                    </View>

                    <View style={styles.progressContainer}>
                        <View style={styles.progressBarShell} />
                        <View style={styles.progressBar} />
                    </View>

                    <View style={styles.pondMoyContainer}>
                        <View style={styles.boxPond}>
                            <PieChart 
                                radius={80}
                                showText
                                textColor="black"
                                data = {pond}  
                            />
                            <Text style={{fontSize: 17, paddingTop: 5}}>
                                <Text style={{color: '#177AD5'}}>■</Text><Text> Examen</Text>
                                <Text style={{color: '#79D2DE'}}> ■</Text><Text> Test </Text>
                                <Text style={{color: '#ED6665'}}>■</Text><Text> Devoir</Text>
                            </Text>
                            {/*add missing components*/}
                            <Text style={{fontSize: 17}}>
                                <Text>■ test4 </Text>
                                <Text> ■ test5 </Text>
                                <Text> ■ test6</Text>
                            </Text>
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
    mainContainer: {
        height: '100%',
        backgroundColor: '#e7eff6'
    },
    perfTitle: {
        position: 'absolute',
        top: 5,
        left: '30%',
        fontSize: 30,
    },
    container: {
        alignItems: 'center',
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
        backgroundColor: '#adcbe3',
        position: 'absolute',
        top: 325,
        width: '90%',
        height: 300,
        alignItems: 'center',
        borderRadius: 5
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
        backgroundColor: '#adcbe3',
        position: 'absolute',
        top: 325,
        width: '90%',
        height: 100,
        alignItems: 'center',
        justifyContent: 'center',
        borderRadius: 5
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
        backgroundColor: '#4b86b4',
        borderRadius: 5,
        borderWidth: 2,
        borderColor: '#4b86b4',
        width: 150,
        height: 30,
        position: 'absolute',
        left: 18
    },
    //Ponderation
    pondMoyContainer: {
        width: '90%',
        height: 225,
        position: 'absolute',
        top: 445,
        flexDirection: 'row',
        justifyContent: 'center',
    },
    boxPond: {
        backgroundColor: '#adcbe3',
        width: '47%',
        marginRight: '6%',
        borderRadius: 5,
        alignItems: 'center',
        paddingTop: 8
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