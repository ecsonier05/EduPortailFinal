/*
    Programmeurs:   André Doucet, Janie Bérubé, Clément Sonier
    Projet:         PROG 1301 - Projet final - EduPortail
    Description:    Accueil
*/

// Importation de modules
import React, { useEffect, useState } from 'react';
import { View, Text, Image, StyleSheet, TouchableOpacity } from 'react-native';
import { Dimensions } from 'react-native';
import { RFPercentage, RFValue } from "react-native-responsive-fontsize";
import { useRoute } from "@react-navigation/native";

const windowWidth = Dimensions.get('window').width;
const windowHeight = Dimensions.get('window').height;

export default function MainScreen({ navigation }) {
    const route = useRoute();
    const idInscription = route.params?.id;

    const matriculeVar = 2051798;

    const [classData, setClassData] = useState(null);
    const [sessionActData, setSessionActData] = useState(null);
    const [evalData, setEvalData] = useState(null);
    const [evalTotalData, setEvalTotalData] = useState(null);
    const [retroData, setRetroData] = useState(null);
    const [moyenneSouhaiteeData, setMoyenneSouhaiteeData] = useState(null);
    const [loading, setLoading] = useState(true);

    const urlClass = `http://192.168.56.1:3000/api/cours/${matriculeVar}`;
    const urlSessionAct = `http://192.168.56.1:3000/api/sessionactuelle/${matriculeVar}`;
    const urlEval = `http://192.168.56.1:3000/api/evaluations/matricule/${matriculeVar}`;
    const urlEvalTotal = `http://192.168.56.1:3000/api/evaluations/inscription/${idInscription}`;
    const urlRetro = `http://192.168.56.1:3000/api/evaluations/retroaction/${matriculeVar}`;
    const urlMoyenneSouhaitee = `http://192.168.56.1:3000/api/moyenneSouhaitee/${matriculeVar}`;

    useEffect(() => {
        fetchData(urlClass, setClassData);
        fetchData(urlSessionAct, setSessionActData);
        fetchData(urlEval, setEvalData);
        fetchData(urlEvalTotal, setEvalTotalData);
        fetchData(urlRetro, setRetroData);
        fetchData(urlMoyenneSouhaitee, setMoyenneSouhaiteeData);
    }, []);

    const fetchData = (url, setData) => {
        fetch(url)
            .then((resp) => {
                if (!resp.ok) {
                    throw new Error('La réponse du réseau est incorrecte.');
                }
                return resp.json();
            })
            .then((json) => setData(json))
            .catch((error) => console.error('Erreur lors de la récupération des données:', error))
            .finally(() => setLoading(false));
    };

    const findSigle = () => {
        if (classData) {
            for (let i = 0; i < 3 && i < classData.length; i++) {
                if (classData[i].idInscription === idInscription) {
                    return classData[i].sigle || '';
                }
            }
        }
        return '';
    }

    const findNomEval = () => {
        if (evalData) {
            for (let i = 0; i < 3 && i < evalData.length; i++) {
                if (evalData[i].idInscription === idInscription) {
                    return evalData[i].nomEvaluation || '';
                }
            }
        }
        return '';
    }

    const findNotePourcentage = () => {
        if (evalData) {
            for (let i = 0; i < 3 && i < evalData.length; i++) {
                if (evalData[i].idInscription === idInscription) {
                    return evalData[i].notePourcentage || '';
                }
            }
        }
        return '';
    }

    const renderRecentEvals = () => {
        const evalItems = [];
        if (evalData) {
            const recentEvals = evalData.slice(0, 3);
            recentEvals.forEach((evaluation, index) => {
                evalItems.push(
                    <View style={styles.evalRow} key={index}>
                        <Text numberOfLines={1} style={styles.evalText}>{evaluation.sigle}</Text>
                        <Text numberOfLines={1} style={styles.evalText}>{evaluation.nomEvaluation}</Text>
                        <Text numberOfLines={1} style={styles.evalText}>{evaluation.notePourcentage.toFixed(2)}%</Text>
                    </View>
                );
            });
        }
        return evalItems;
    };

    const renderRetro = () => {
        const retroItems = [];
        if (retroData) {
            const recentRetros = retroData.slice(0, 3);
            recentRetros.forEach((retroaction, index) => {
                retroItems.push(
                    <View style={styles.retroRow} key={index}>
                        <Text numberOfLines={1} style={styles.retroText}>{retroaction.sigle}</Text>
                        <Text numberOfLines={1} style={styles.retroText}>{retroaction.nomEvaluation}</Text>
                        <TouchableOpacity style={styles.retroButton} onPress={() => navigation.navigate('EvalClass', { id: 2 })}>
                            <Text style={styles.retroBtnText}>Voir Plus</Text>
                        </TouchableOpacity>
                    </View>
                );
            });
        }
        return retroItems;
    };

    let totalScore = 0;
    let totalCourses = 0;

    if (evalData) {
        evalData.forEach(evaluation => {
            if (evaluation.notePourcentage) {
                totalScore += evaluation.notePourcentage;
                totalCourses++;
            }
        });
    }

    let moyGenerale = totalCourses > 0 ? totalScore / totalCourses : 0;
    moyGenerale = moyGenerale.toFixed(2);

    const backgroundColorMoyenneGenerale = (moyGenerale, moyenneSouhaiteeData) => {
        if (moyenneSouhaiteeData && moyGenerale >= moyenneSouhaiteeData.moyenneSouhaitee) {
            return '#7ac25a';
        } else if (moyGenerale >= 60) {
            return '#f1c232';
        } else {
            return '#ff4137';
        }
    };

    let forceMoyenne = 0;
    let coursForceMoyenne = '';

    if (evalTotalData) {
        evalTotalData.forEach(cours => {
            let average = 0;
            let totalScore = 0;
            let totalCours = 0;

            // Calculate average for each cours
            cours.evaluations.forEach(evaluation => {
                if (evaluation.notePourcentage) {
                    totalScore += evaluation.notePourcentage;
                    totalCours++;
                }
            });

            if (totalCours > 0) {
                average = totalScore / totalCours;
            }

            // Update forceMoyenne if the average of this cours is higher
            if (average > forceMoyenne) {
                forceMoyenne = average;
                coursForceMoyenne = cours.sigle;
            }
        });
    }

    const backgroundColorForce = () => {
        if (moyenneSouhaiteeData && forceMoyenne >= moyenneSouhaiteeData.moyenneSouhaitee) {
            return '#7ac25a';
        } else if (forceMoyenne >= 60) {
            return '#f1c232';
        } else {
            return '#ff4137';
        }
    };

    const backgroundColorFaiblesse = () => {
        if (moyenneSouhaiteeData && forceMoyenne < moyenneSouhaiteeData.moyenneSouhaitee) {
            return '#7ac25a';
        } else if (forceMoyenne < 60) {
            return '#f1c232';
        } else {
            return '#ff4137';
        }
    };

    // JSX rendering
return (
    <View style={styles.container}>
        {moyenneSouhaiteeData && (
            <>
                {/* Section titre */}
                <View style={styles.titleContainer}>
                    <TouchableOpacity onPress={() => navigation.navigate('Profil')}>
                        <Image source={require("../assets/alexandreRoy.jpg")} style={styles.profileIcon} />
                    </TouchableOpacity>
                    <Text style={styles.titleText}>Ma moyenne générale</Text>
                    <Text style={styles.sessionText}>{sessionActData ? sessionActData.nomSession : ''}</Text>
                </View>

                {/* Moyenne générale */}
                <View style={[styles.moyenneContainer, { backgroundColor: backgroundColorMoyenneGenerale(parseFloat(moyGenerale), moyenneSouhaiteeData) }]}>
                    <Text style={styles.moyenneText}>{moyGenerale}%</Text>
                </View>

                {/* Évaluations récentes */}
                <View style={styles.evalContainer}>
                    <Text style={styles.contTitle}>Notes d'évaluation récentes</Text>
                    {renderRecentEvals()}
                    <TouchableOpacity style={styles.evalButton} onPress={() => navigation.navigate('Évaluations')}>
                        <Text style={styles.evalBtnText}>Voir Plus</Text>
                    </TouchableOpacity>
                </View>

                <View style={styles.retroContainer}>
                    <Text style={styles.contTitle}>Rétroactions récentes</Text>
                    {/*add function to pressable*/}
                    {renderRetro()}
                </View>

                {/*backend code to check the highest and lowest grades*/}
                <View style={styles.forceFaiblesseContainer}>
                    <View style={styles.boxForce}>
                        <Text style={styles.contTitle}>Force</Text>
                        <View style={styles.boxForceInfo}>
                            <View style={[styles.moyForce, { backgroundColor: backgroundColorForce() }]}>
                                <Text style={styles.forcePour}>89.72%</Text>
                            </View>
                            <Text style={styles.moyForceText}>PROG1301</Text>
                        </View>
                    </View>
                    <View style={styles.boxFaiblesse}>
                        <Text style={styles.contTitle}>Faiblesse</Text>
                        <View style={styles.boxFaiblesseInfo}>
                            <View style={[styles.moyFaiblesse, { backgroundColor: backgroundColorFaiblesse() }]}>
                                <Text style={styles.forcePour}>84.27%</Text>
                            </View>
                            <Text style={styles.moyFaiblesseText}>PROG1342</Text>
                        </View>
                    </View>
                </View>
            </>
        )}
    </View>
);
}

const styles = StyleSheet.create({
    //main Container
    container: {
        flex: 1,
        backgroundColor: '#e7eff6',
        alignItems: 'center',
        justifyContent: 'flex-end',
    },
    //top of screen includes profileIcon and titleText
    titleContainer: {
        flexDirection: 'row',
        position: 'absolute',
        top: '6%',
        left: 20,
        alignItems: 'center',
        width: '95%'
    },
    profileIcon: {
        width: 40,
        height: 40,
        borderRadius: 20,
        marginRight: 30,
    },
    titleText: {
        fontSize: 24,
        fontWeight: 'bold',
        textAlign: 'center',
    },
    sessionText: {
        position: 'absolute',
        top: windowHeight * 0.1,
        marginLeft: '10%',
        fontSize: RFPercentage(2.5),
    },

    //for circle with moyenne
    moyenneContainer: {
        //backgroundColor: backgroundColorMoyenneGenerale(parseFloat(moyGenerale)),
        width: windowWidth * 0.3,
        height: windowHeight * 0.15,
        borderRadius: (windowWidth * 0.3) / 2,  // Cercle parfait
        position: 'absolute',
        right: '10%',
        top: windowHeight * 0.12,
        alignItems: 'center',
        justifyContent: 'center',               // Centrer le texte verticalement
    },
    moyenneText: {
        fontSize: 25,
        fontWeight: 'bold',
        color: 'white',
    },
    //for subcontainers
    contTitle: {
        fontSize: RFValue(16),
        fontWeight: 'bold',
        marginLeft: 10,
        marginTop: 5
    },
    evalContainer: {
        backgroundColor: '#adcbe3',
        width: '90%',
        height: windowHeight * 0.19,
        borderRadius: 5,
        position: 'absolute',
        top: '30%',
    },
    evalRow: {
        flexDirection: 'row',
        marginBottom: 5,
        backgroundColor: '#e7eff6',
        borderRadius: 5,
        marginHorizontal: '4%',
    },
    evalText: {
        flex: 1,
        textAlign: 'center',
    },
    evalButton: {
        height: windowHeight * 0.04,
        alignItems: 'center',
        justifyContent: 'center',
        borderRadius: 4,
        elevation: 3,
        backgroundColor: '#2a4d69',
    },
    evalBtnText: {
        fontSize: 20,
        lineHeight: 21,
        fontWeight: 'bold',
        letterSpacing: 0.25,
        color: 'white',
    },
    retroContainer: {
        backgroundColor: '#adcbe3',
        width: '90%',
        height: windowHeight * 0.17,
        position: 'absolute',
        top: '52%',
        borderRadius: 5
    },
    retroRow: {
        flexDirection: 'row',
        height: '18%',
        marginBottom: '2%',
        marginHorizontal: 15,
        alignItems: 'center',
        backgroundColor: '#ffff',
        borderRadius: 5
    },
    retroText: {
        flex: 1,
        alignItems: 'center',
        paddingLeft: 4
    },
    retroButton: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'center',
        height: '100%',
        borderRadius: 4,
        elevation: 3,
        backgroundColor: '#4b86b4',
    },
    retroBtnText: {
        fontSize: 16,
        lineHeight: 21,
        fontWeight: 'bold',
        letterSpacing: 0.25,
        color: 'white',
    },
    forceFaiblesseContainer: {
        width: '90%',
        height: windowHeight * 0.22,
        position: 'absolute',
        top: '72%',
        flexDirection: 'row',
        justifyContent: 'center',
    },
    boxForce: {
        backgroundColor: '#adcbe3',
        width: '47%',
        marginRight: '6%',
        borderRadius: 5,
    },
    boxForceInfo: {
        flexDirection: 'column',
        alignItems: 'center'
    },
    moyForceText: {
        textAlign: 'center',
        marginTop: 10
    },
    moyForce: {
        backgroundColor: '#7ac25a',
        width: windowWidth * 0.25,
        height: windowHeight * 0.125,
        borderRadius: (windowWidth * 0.25) / 2,
        alignItems: 'center',
        justifyContent: 'center'
    },
    boxFaiblesse: {
        backgroundColor: '#adcbe3',
        width: '47%',
        borderRadius: 5,
    },
    boxFaiblesseInfo: {
        flexDirection: 'column',
        alignItems: 'center'
    },
    moyFaiblesseText: {
        textAlign: 'center',
        marginTop: 10
    },
    moyFaiblesse: {
        backgroundColor: '#f1c232',
        width: windowWidth * 0.25,
        height: windowHeight * 0.125,
        borderRadius: (windowWidth * 0.25) / 2,
        alignItems: 'center',
        justifyContent: 'center'
    },
    forcePour: {
        fontWeight: 'bold',
        fontSize: RFValue(16),
        color: 'white'
    }
})