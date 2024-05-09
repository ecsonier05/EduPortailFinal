import React, { useEffect, useState } from 'react';
import { Text, View, StyleSheet, Image, TextInput, TouchableOpacity, ActivityIndicator } from 'react-native';
import BouncyCheckbox from "react-native-bouncy-checkbox";

export default function ProfileScreen(props) {

    const [data, setData] = useState(null);
    const [loading, setLoading] = useState(true);

    const matricule = 2051798;
    //const url = `https://eduportail-69af4de32dad.herokuapp.com/api/etudiants/${matricule}`;
    const url = `http://10.50.0.107/api/etudiants/${matricule}`;

    useEffect(() => {
        fetch(url)
          .then((resp) => resp.json())
          .then((json) => setData(json))
          .catch((error) => console.error(error))
          .finally(() => setLoading(false));
      });

    return (
        <View style={styles.container}>
            {loading ? (
                <ActivityIndicator />
            ) : (
                <View style={styles.container}>
                    <View style={styles.titleContainer}>
                        <Text style={styles.titleText}>Mon Profil</Text>
                        <Image 
                            source={require("../assets/TheSonOfMan.jpg")}
                            style={styles.profileIcon}
                        />
                    </View>

                    <Text style={styles.infoTitle}>Informations</Text>
                    <View style={styles.infoContainer}>
                        <View style={styles.tfContainer}>
                            <Text style={styles.fieldText}>Prénom</Text>
                            <TextInput style={styles.fieldInput} editable={false} value={data.prenom} />
                        </View>
                        <View style={styles.tfContainer}>
                            <Text style={styles.fieldText}>Nom</Text>
                            <TextInput style={styles.fieldInput} editable={false} placeholder={"Doe"} />
                        </View>
                        <View style={styles.tfContainer}>
                            <Text style={styles.fieldText}>Nom d`utilisateur</Text>
                            <TextInput style={styles.fieldInput} editable={false} placeholder={"ejdoe03"} />
                        </View>
                        <View style={styles.tfContainer}>
                            <Text style={styles.fieldText}>Matricule</Text>
                            <TextInput style={styles.fieldInput} editable={false} placeholder={"2222222"} />
                        </View>
                        <View style={styles.tfContainer}>
                            <Text style={styles.fieldText}>Programme</Text>
                            <TextInput style={styles.fieldInput} editable={false} placeholder={"Programmation et applications mobiles"} />
                        </View>
                        <View style={styles.tfContainer}>
                            <Text style={styles.fieldText}>Courriel</Text>
                            <TextInput style={styles.fieldInput} editable={false} placeholder={"ejdoe@monccnb.ca"} />
                        </View>
                        <View style={styles.tfContainer}>
                            <Text style={styles.fieldText}>Année d`étude</Text>
                            <TextInput style={styles.fieldInput} editable={false} placeholder={"2"} />
                        </View>
                    </View>

                    <Text style={styles.objectifTitle}>Objectif</Text>
                    <View style={styles.objectifContainer}>
                        <Text style={styles.goalTitle}>Moyenne generale souhaitee</Text>
                        <TextInput style={styles.goalContainer} placeholder={"100%"} />
                        <TouchableOpacity style={styles.editButton}>
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
        fontSize: 40,
        fontWeight: 'bold',
    },
    profileIcon: {
        width: 100,
        height: 100,
        borderRadius: 50,
        borderWidth: 8,
        borderColor: '#ffff',
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
        height: 320,
        borderRadius: 5,
        position: 'absolute',
        top: 210,
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
        fontSize: 19,
    },
    fieldInput: {
        borderColor: '#808080',
        borderWidth: 2,
        borderRadius: 5,
        width: 220,
        textAlign: 'center',
        backgroundColor: 'white',
    },
    objectifTitle: {
        position: 'absolute',
        top: 550,
        left: 25,
        fontWeight: 'bold'
    },
    objectifContainer : {
        backgroundColor: '#adcbe3',
        width: '90%',
        height: 50,
        borderRadius: 5,
        position: 'absolute',
        top: 566,
        flexDirection: 'row',
        alignItems: 'center',
        paddingHorizontal: 20
    },
    goalTitle: {
        flex: 1,
        fontSize: 19,
    },
    goalContainer: {
        backgroundColor: 'white',
        borderColor: '#808080',
        borderWidth: 2,
        width: 80,
        height: 30,
        fontSize: 25,
        textAlign: 'center',
        borderRadius: 10,
        marginRight: 10,
    },
    editButton: {
        backgroundColor: '#4b86b4',
        width: 30,
        height: 30,
        borderRadius: 10,
        marginRight: 5,
    },
    editIcon: {
        fontSize: 25,
        textAlign: 'center',
        color: 'white'
    },
    notifTitle: {
        position: 'absolute',
        top: 635,
        left: 25,
        fontWeight: 'bold'
    },
    notifContainer: {
        backgroundColor: '#adcbe3',
        width: '90%',
        height: 125,
        borderRadius: 5,
        position: 'absolute',
        top: 650,
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
        paddingLeft: 10,
        color: 'white',
        fontWeight: 'bold'
    }
})