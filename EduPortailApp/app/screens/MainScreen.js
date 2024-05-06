/*
    Programmeurs:   André Doucet, Janie Bérubé, Clément Sonier
    Projet:         PROG 1301 - Projet final - EduPortail
    Description:    Accueil
*/

import React from 'react';
import { View, Text, Image, StyleSheet, TouchableOpacity } from 'react-native';
import { Dimensions } from 'react-native';
import { RFPercentage, RFValue } from "react-native-responsive-fontsize";

const windowWidth = Dimensions.get('window').width;
const windowHeight = Dimensions.get('window').height;

export default function MainScreen({ navigation }) {

    let moyGenerale = 86.50;
    moyGenerale = moyGenerale.toFixed(2);

    return (
        <View style={styles.container}>
            <View style={styles.titleContainer}>
                {/*Get image from database*/}
                <TouchableOpacity onPress={() => navigation.navigate('Profil')}>
                    <Image
                        source={require("../assets/TheSonOfMan.jpg")}
                        style={styles.profileIcon}
                    />
                </TouchableOpacity>
                <Text style={styles.titleText}>Ma moyenne générale</Text>

                <Text style={styles.sessionText}>{"Session:\n Printemps 2024"}</Text>
            </View>



            <View style={styles.moyenneContainer}>
                {/*Do math here*/}
                <Text style={styles.moyenneText}>{moyGenerale}%</Text>
            </View>

            <View style={styles.evalContainer}>
                <Text style={styles.contTitle}>Notes d'évaluation récentes</Text>

                {/*add a for loop here*/}
                <View style={styles.evalRow}>
                    <Text numberOfLines={1} style={styles.evalText}>SYST1036</Text>
                    <Text numberOfLines={1} style={styles.evalText}>Projet 1 L'analyse</Text>
                    <Text numberOfLines={1} style={styles.evalText}>92.81%</Text>
                </View>
                <View style={styles.evalRow}>
                    <Text numberOfLines={1} style={styles.evalText}>PROG1206</Text>
                    <Text numberOfLines={1} style={styles.evalText}>Test 2</Text>
                    <Text numberOfLines={1} style={styles.evalText}>92.81%</Text>
                </View>
                <View style={styles.evalRow}>
                    <Text numberOfLines={1} style={styles.evalText}>PROG1236</Text>
                    <Text numberOfLines={1} style={styles.evalText}>Devoir 2 - Phase B - partie 1</Text>
                    <Text numberOfLines={1} style={styles.evalText}>97.19%</Text>
                </View>
                {/*Add function to pressable*/}
                <TouchableOpacity style={styles.evalButton}>
                        <Text style={styles.evalBtnText}>Voir Plus</Text>
                </TouchableOpacity>
            </View>

            <View style={styles.retroContainer}>
                <Text style={styles.contTitle}>Rétroactions récentes</Text>

                {/*for loop for 3 most recent*/}
                {/*add function to pressable*/}
                <View style={styles.retroRow}>
                    <Text numberOfLines={1} style={styles.retroText}>SYST1036   Devoir 2 - Phase B - Partie 3</Text>
                    <TouchableOpacity style={styles.retroButton}>
                        <Text style={styles.retroBtnText}>Voir Plus</Text>
                    </TouchableOpacity>
                </View>
                <View style={styles.retroRow}>
                    <Text numberOfLines={1} style={styles.retroText}>PROG1206   Test 2</Text>
                    <TouchableOpacity style={styles.retroButton}>
                        <Text style={styles.retroBtnText}>Voir Plus</Text>
                    </TouchableOpacity>
                </View>
                <View style={styles.retroRow}>
                    <Text numberOfLines={1} style={styles.retroText}>{"SYST1036   Projet 1 - L'analyse"}</Text>
                    <TouchableOpacity style={styles.retroButton}>
                        <Text style={styles.retroBtnText}>Voir Plus</Text>
                    </TouchableOpacity>
                </View>
            </View>

            {/*backend code to check the highest and lowest grades*/}
            <View style={styles.forceFaiblesseContainer}>
                <View style={styles.boxForce}>
                    <Text style={styles.contTitle}>Force</Text>
                    <View style={styles.boxForceInfo}>
                        <View style={styles.moyForce}>
                            <Text style={styles.forcePour}>96.49%</Text>
                        </View>
                        <Text style={styles.moyForceText}>PROG1206</Text>
                    </View>
                </View>
                <View style={styles.boxFaiblesse}>
                    <Text style={styles.contTitle}>Faiblesse</Text>
                    <View style={styles.boxFaiblesseInfo}>
                        <View style={styles.moyFaiblesse}>
                            <Text style={styles.forcePour}>67.26%</Text>
                        </View>
                        <Text style={styles.moyFaiblesseText}>PROG1206</Text>
                    </View>
                </View>
            </View>
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
        fontSize: RFPercentage(2),
    },

    //for circle with moyenne
    moyenneContainer: {
        backgroundColor: '#7ac25a',
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