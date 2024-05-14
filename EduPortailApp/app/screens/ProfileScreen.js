import React, { useEffect, useState } from 'react';
import { Text, View, StyleSheet, Image, TextInput, TouchableOpacity, ActivityIndicator } from 'react-native';
import BouncyCheckbox from "react-native-bouncy-checkbox";
import { KeyboardAwareScrollView } from 'react-native-keyboard-aware-scroll-view';

export default function ProfileScreen(props) {

    const [etudiantData, setEtudiantData] = useState(null);
    const [programmeData, setProgrammeData] = useState(null);
    const [moyenneSouhaiteeData, setMoyenneSouhaiteeData] = useState(null);
    const [loading, setLoading] = useState(true);
    const [editedMoyenneSouhaitee, setEditedMoyenneSouhaitee] = useState('');
    const [inputError, setInputError] = useState('');


    // Fonction pour mise a jour de la moyenne souhaitée
    const handleEditMoyenneSouhaitee = () => {
        // Validation de la nouvelle valeur
        const moyenne = parseInt(editedMoyenneSouhaitee);
        if (isNaN(moyenne) || moyenne < 60 || moyenne > 100) {
            setInputError('Moyenne souhaitée doit être un entier entre 60 et 100.');
            return;
        }
        // Send the updated moyenne souhaitée to the server
        // You need to implement this part using fetch or other methods
        // Reset input error and update state after successful update
        setInputError('');
        // Update the state or perform any necessary action after successful update
    };


    const matriculeVar = 2051798;


    // Liens BD locale
    /*
    const urlEtudiant = `http://192.168.56.1:3000/api/etudiants/${matriculeVar}`;
    const urlProgramme = `http://192.168.56.1:3000/api/programmes/${matriculeVar}`;
    const urlMoyenneSouhaitee = `http://192.168.56.1:3000/api/moyenneSouhaitee/${matriculeVar}`;
    */

    // Liens BD remote

    const urlEtudiant = `https://eduportail-69af4de32dad.herokuapp.com/api/etudiants/${matriculeVar}`;
    const urlProgramme = `https://eduportail-69af4de32dad.herokuapp.com/api/programmes/${matriculeVar}`;
    const urlMoyenneSouhaitee = `https://eduportail-69af4de32dad.herokuapp.com/api/moyenneSouhaitee/${matriculeVar}`;


    useEffect(() => {
        fetchData(urlEtudiant, setEtudiantData);
        fetchData(urlProgramme, setProgrammeData);
        fetchData(urlMoyenneSouhaitee, setMoyenneSouhaiteeData);
    }, []);

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

    return (
        <View style={styles.container}>
            {loading ? (
                <ActivityIndicator />
            ) : (
                <View style={styles.container}>
                    <View style={styles.titleContainer}>
                        <Text style={styles.titleText}>Mon Profil</Text>
                        <Image 
                            source={require("../assets/alexandreRoy.jpg")}
                            style={styles.profileIcon}
                        />
                    </View>

                    <Text style={styles.infoTitle}>Informations</Text>
                    <View style={styles.infoContainer}>
                        <View style={styles.tfContainer}>
                            <Text style={styles.fieldText}>Prénom</Text>
                            <TextInput style={styles.fieldInput} editable={false} placeholder={etudiantData ? etudiantData.prenom : ''} />
                        </View>
                        <View style={styles.tfContainer}>
                            <Text style={styles.fieldText}>Nom</Text>
                            <TextInput style={styles.fieldInput} editable={false} placeholder={etudiantData ? etudiantData.nom : ''} />
                        </View>
                        <View style={styles.tfContainer}>
                            <Text style={styles.fieldText}>Nom d`utilisateur</Text>
                            <TextInput style={styles.fieldInput} editable={false} placeholder={etudiantData ? etudiantData.nomUtilisateur : ''} />
                        </View>
                        <View style={styles.tfContainer}>
                            <Text style={styles.fieldText}>Matricule</Text>
                            <TextInput style={styles.fieldInput} editable={false} placeholder={etudiantData ? etudiantData.matricule.toString() : ''} />
                        </View>
                        <View style={styles.tfContainer}>
                            <Text style={styles.fieldText}>Programme</Text>
                            <TextInput style={styles.fieldInputProgramme} editable={false} placeholder={programmeData ? programmeData.titreProgramme : ''} />
                        </View>
                        <View style={styles.tfContainer}>
                            <Text style={styles.fieldText}>Courriel</Text>
                            <TextInput style={styles.fieldInput} editable={false} placeholder={etudiantData ? etudiantData.courrielEtudiant : ''} />
                        </View>
                        <View style={styles.tfContainer}>
                            <Text style={styles.fieldText}>Année d`études</Text>
                            <TextInput style={styles.fieldInput} editable={false} placeholder={etudiantData ? etudiantData.anneeEtudes.toString() : ''} />
                        </View>
                    </View>

                    <Text style={styles.objectifTitle}>Objectif</Text>
                    <View style={styles.objectifContainer}>
                        <Text style={styles.fieldText}>Moyenne générale souhaitée</Text>
                        <KeyboardAwareScrollView contentContainerStyle={styles.scrollContainer}>
                            <TextInput
                                style={styles.goalContainer}
                                editable={true}
                                placeholder={(moyenneSouhaiteeData ? moyenneSouhaiteeData.moyenneSouhaitee.toString() : '') + '%'}
                                onChangeText={text => setEditedMoyenneSouhaitee(text)}
                                value={editedMoyenneSouhaitee}
                            />
                        </KeyboardAwareScrollView>
                        <TouchableOpacity style={styles.editButton} onPress={handleEditMoyenneSouhaitee}>
                            <Text style={styles.editIcon}>&#x270E;</Text>
                        </TouchableOpacity>
                    </View>

                    <Text style={styles.notifTitle}>Notification</Text>
                    <View style={styles.notifContainer}>
                        <View style={styles.notifRow}>
                            <Text style={styles.appText}>Application</Text>
                            <BouncyCheckbox 
                                fillColor='white'
                                
                            />
                        </View>
                        <View style={styles.notifRow}>
                            <Text style={styles.appText}>Courriel</Text>
                            <BouncyCheckbox 
                                fillColor='white'
                            />
                        </View>
                    </View>
                </View>
                )}
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#e7eff6',
        alignItems: 'center',
        justifyContent: 'flex-end',
    },
    titleContainer: {
        position: 'absolute',
        top: 50,
        alignItems: 'center',
    },
    titleText: {
        fontSize: 35,
        fontWeight: 'bold',
    },
    profileIcon: {
        width: 90,
        height: 90,
        borderRadius: 50,
        borderWidth: 1,
        borderColor: 'black',
    },
    infoTitle: {
        position: 'absolute',
        top: 195,
        left: 25,
        fontWeight: 'bold'
    },
    infoContainer: {
        backgroundColor: '#adcbe3',
        width: '90%',
        height: 360,
        borderRadius: 5,
        position: 'absolute',
        top: 215,
    },
    tfContainer: {
        alignItems: 'center',
        flexDirection: 'row',
        marginBottom: 11,
        marginHorizontal: 15,
        top: 15
    },
    fieldText: {
        flex: 1,
        fontSize: 16,
    },
    fieldInput: {
        borderColor: '#808080',
        borderWidth: 2,
        borderRadius: 5,
        width: 170,
        height: 35,
        textAlign: 'center',
        backgroundColor: 'white',
        fontWeight: 'bold',
    },
    fieldInputProgramme: {
        borderColor: '#808080',
        borderWidth: 2,
        borderRadius: 5,
        width: 240,
        height: 40,
        textAlign: 'center',
        backgroundColor: 'white',
        paddingLeft: 10,
        fontWeight: 'bold',
    },
    objectifTitle: {
        top: -30,
        left: 25,
        fontWeight: 'bold'
    },
    objectifContainer : {
    backgroundColor: '#adcbe3',
    width: '90%',
    minHeight: 50,
    borderRadius: 5,
    top: -29,
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 20,
    },
    goalTitle: {
        flex: 1,
        fontSize: 19,
    },
    goalContainer: {
        backgroundColor: 'white',
        borderColor: '#808080',
        borderWidth: 2,
        width: 115,
        height: 33,
        fontSize: 25,
        textAlign: 'center',
        borderRadius: 16,
    },
    editButton: {
        backgroundColor: '#4b86b4',
        width: 60,
        height: 40,
        borderRadius: 10,
        marginRight: 5,
    },
    editIcon: {
        fontSize: 25,
        textAlign: 'center',
        color: 'white'
    },
    notifTitle: {
        top: -18,
        left: 25,
        fontWeight: 'bold'
    },
    notifContainer: {
        backgroundColor: '#adcbe3',
        width: '90%',
        height: 125,
        borderRadius: 5,
        top: -16,
        alignItems: 'center',
    },
    notifRow: {
        flexDirection: 'row',
        alignItems: 'center',
        marginBottom: 11,
        marginHorizontal: 50,
        top: 15,
        borderColor: '#4b86b4',
        backgroundColor: '#4b86b4',
        borderWidth: 2,
        borderRadius: 20,
        height: 40
    },
    appText: {
        flex: 1,
        fontSize: 19,
        paddingLeft: 60,
        color: 'white',
        fontWeight: 'bold'
    }
})