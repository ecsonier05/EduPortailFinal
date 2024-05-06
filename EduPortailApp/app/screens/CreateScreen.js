import React from 'react';
import { StyleSheet, Text, TextInput, TouchableOpacity, View } from 'react-native';

export default function CreateScreen(props) {
    return (
        <View style={styles.container}>
            <View style={styles.TextFieldContainer}>
                <Text>Prénom</Text>
                <TextInput style={styles.textField} />
            </View>

            <View style={styles.TextFieldContainer}>
                <Text>Nom</Text>
                <TextInput style={styles.textField} />
            </View>

            <View style={styles.TextFieldContainer}>
                <Text>Matricule</Text>
                <TextInput style={styles.textField} />
            </View>

            <View style={styles.TextFieldContainer}>
                <Text>Courriel étudiant</Text>
                <TextInput style={styles.textField} />
            </View>

            <View style={styles.TextFieldContainer}>
                <Text>Mot de passe</Text>
                <TextInput style={styles.textField} />
            </View>

            <View style={styles.TextFieldContainer}>
                <Text>Réécrire votre mot de passe</Text>
                <TextInput style={styles.textField} />
            </View>

            <TouchableOpacity style={styles.buttonCreate}>
                <Text style={styles.textCreate}>Créer votre compte</Text>
            </TouchableOpacity>
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#E0E0E0',
        alignItems: 'center',
        justifyContent: 'flex-start',
        paddingTop: 50
    },
    textFieldLabel: {
        paddingBottom: 5
    },
    textField: {
        backgroundColor: 'white',
        width: '100%',
        height: 45,
        borderRadius: 5,
        fontSize: 20,
        paddingHorizontal: 10,
    },
    TextFieldContainer: {
        width: '80%',
        paddingVertical: 15
    },
    buttonCreate: {
        backgroundColor: '#3d88ec',
        width: '80%',
        height: 55,
        borderRadius: 5,
        alignItems: 'center',
        justifyContent: 'center',
        position: 'absolute',
        top: 625,
    },
    textCreate: {
        fontSize: 20,
        lineHeight: 21,
        fontWeight: 'bold',
        letterSpacing: 0.25,
        color: 'white',
    },
})