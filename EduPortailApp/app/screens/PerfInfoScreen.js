import React, { useEffect, useState } from 'react';
import { Text, View, StyleSheet } from 'react-native';
import { useRoute } from "@react-navigation/native";
import { BarChart, LineChart, PieChart, PopulationPyramid } from "react-native-gifted-charts";
import { RFPercentage, RFValue } from "react-native-responsive-fontsize";

export default function PerfInfoScreen(props) {

    const route = useRoute();
    const idInscription = route.params?.id;
    const mode = route.params?.mode;

    const matriculeVar = 2051798;

    let desired = 0;
    let obtained = 0;

    let data = [];
    let pond = [];

    let avgResult = 0;

    

    const [evalData, setEvalData] = useState(null);
    const [evalTotalData, setEvalTotalData] = useState(null);
    const [classData, setClassData] = useState(null);
    const [moyDData, setMoyDData] = useState(null);
    const [loading, setLoading] = useState(true);


    //Liens BD locale

    const urlEval = `http://192.168.56.1:3000/api/evaluations/inscription/${idInscription}`;
    const urlEvalTotal = `http://192.168.56.1:3000/api/evaluations/matricule/${matriculeVar}`;
    const urlClass = `http://192.168.56.1:3000/api/cours/${matriculeVar}`;
    const urlMoyD = `http://192.168.56.1:3000/api/moyenneSouhaitee/${matriculeVar}`;


    //Liens BD remote
    /*
    const urlEval = `https://eduportail-69af4de32dad.herokuapp.com/api/evaluations/inscription/${idInscription}`;
    const urlEvalTotal = `https://eduportail-69af4de32dad.herokuapp.com/api/evaluations/matricule/${matriculeVar}`;
    const urlClass = `https://eduportail-69af4de32dad.herokuapp.com/api/cours/${matriculeVar}`;
    const urlMoyD = `https://eduportail-69af4de32dad.herokuapp.com/api/moyenneSouhaitee/${matriculeVar}`;
    */

    const fetchData = (url, setData) => {
        fetch(url)
            .then((resp) => {
                if (!resp.ok) {
                    throw new Error('Network response was not ok');
                }
                return resp.json();
            })
            .then((json) => setData(json))
            .catch((error) => console.error('Error fetching data:', error))
            .finally(() => setLoading(false));
    };

    if(mode == 'moy'){

        useEffect(() => {
            fetchData(urlEvalTotal, setEvalTotalData);
            fetchData(urlMoyD, setMoyDData);
            fetchData(urlClass, setClassData);
        }, []);

        desired = moyDData ? moyDData.moyenneSouhaitee : 0;

        let totalScore = 0;
        let totalCourses = 0;

        if (evalTotalData) {
            evalTotalData.forEach(evaluation => {
                if (evaluation.notePourcentage) {
                    totalScore += evaluation.notePourcentage;
                    totalCourses++;
                }
            });
        }

        obtained = totalCourses > 0 ? totalScore / totalCourses : 0;
        obtained = obtained.toFixed(2);

        if(evalTotalData) {
            for (let i = 0; i < (classData ? classData.length : 0); i++) {

                let avgPer = 0;
                let avgWeight = 0;

                for (let j = 0; j < (evalTotalData ? evalTotalData.length : 0); j++) {

                    if ((evalTotalData ? evalTotalData[j].sigle : null) == (classData ? classData[i].sigle : '')) {

                        avgPer += evalTotalData[j].ponderation * evalTotalData[j].notePourcentage;

                        avgWeight += evalTotalData[j].ponderation;

                    }

                    avgResult = avgPer / avgWeight;
                    avgResult = avgResult.toFixed(2);

                }

                let sigleNo = classData[i].sigle;
                sigleNo = sigleNo.substring(5);

                data[i] = {value: avgResult, label: sigleNo};
                
            }
        }

    } else {

        useEffect(() => {
            fetchData(urlEval, setEvalData);
            fetchData(urlMoyD, setMoyDData);
        }, []);

        desired = moyDData ? moyDData.moyenneSouhaitee : 0;

        let avgPer = 0;
        let avgWeight = 0;

        for (let i = 0; i < (evalData ? evalData.length : 0); i++) {
            let color;
            

            if (evalData[i].idType_Evaluation == 1) { //Devoir
                color = '#FF5733'
            }
            else if (evalData[i].idType_Evaluation == 2) { //Test
                color = '#47C2FF'
            }
            else if (evalData[i].idType_Evaluation == 3) { //Projet
                color = '#7FFF00'
            }
            else if (evalData[i].idType_Evaluation == 4) { //Presentation
                color = '#FFD700'
            }   
            else if (evalData[i].idType_Evaluation == 5) { //Exercice
                color = '#B03060'
            }
            else if (evalData[i].idType_Evaluation == 6) { //Quiz
                color = '#00FA9A'
            }
            else if (evalData[i].idType_Evaluation == 7) { //Examin
                color = '#9932CC'
            }
            else if (evalData[i].idType_Evaluation == 8) { //Autre
                color = '#FF4500'
            }

            avgPer += evalData[i].ponderation * evalData[i].notePourcentage;

            avgWeight += evalData[i].ponderation;

            pond[i] = {value: evalData[i].ponderation, text: evalData[i].ponderation + '%', color: color}

            data[i] = {value: evalData[i].notePourcentage, label: evalData[i].nomEvaluation}
        }

        pond = [...new Map(pond.map(v => [v.value, v])).values()]

        avgResult = avgPer / avgWeight;
        avgResult = avgResult.toFixed(2);
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
                        <Text style={styles.goalText}>{desired}%</Text>

                        <Text style={styles.currentLabel}>Moyenne generale obtenu(session H2023): </Text>
                        <Text style={styles.currentText}>{obtained}%</Text>

                        {desired < obtained ? (
                            <View style={styles.desiredResultContainer}>
                                {/*add variable for session*/}
                                <Text style={styles.desiredResultText}>
                                    Bravo! Vous avez atteint votre objectif{"\n"}pour la session Hiver 2023!
                                </Text>
                            </View>
                        ) : (
                            <View style={styles.desiredResultContainer}>
                                <Text style={styles.desiredResultText}>
                                    {/*make text less like a kick to the balls and more encouraging to do better*/}
                                    votre objectif na pas été atteint
                                </Text>
                            </View>
                        )}
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
                                <Text style={{color: '#FF5733'}}>■</Text><Text>Devoir</Text>
                                <Text style={{color: '#47C2FF'}}>■</Text><Text>Test</Text>
                            </Text>
                            <Text style={{fontSize: 17}}>
                                <Text style={{color: '#7FFF00'}}>■</Text><Text>Projet</Text>
                                <Text style={{color: '#FFD700'}}>■</Text><Text>Presentation</Text>
                            </Text>
                            <Text style={{fontSize: 17}}>
                                <Text style={{color: '#B03060'}}>■</Text><Text>Exercice </Text>
                                <Text style={{color: '#00FA9A'}}>■</Text><Text>Quiz</Text>
                            </Text>
                            <Text style={{fontSize: 17}}>
                                <Text style={{color: '#9932CC'}}>■</Text><Text>Examen</Text>
                                <Text style={{color: '#FF4500'}}>■</Text><Text>Autre</Text>
                            </Text>
                        </View>
                        <View style={styles.boxMoyenne}>
                            <Text style={styles.contTitle}>Moyenne generale</Text>
                            <View style={styles.boxMoyInfo}>
                                <View style={styles.moyGenerale}>
                                    <Text style={styles.moyPour}>{avgResult}%</Text>
                                </View>
                                <Text style={{fontWeight: 'bold'}}>Votre objectif:</Text>
                                <Text>{desired}%</Text>

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
        height: 350,
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
    desiredResultContainer: {
        backgroundColor: 'white',
        marginTop: 10,
        width: '90%',
        height: '35%',
        borderRadius: 5,
        justifyContent: 'center',
        alignItems: 'center'
    },
    desiredResultText: {
        textAlign: 'center',
        fontSize: 20,
        fontWeight: 'bold'
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
        height: 275,
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