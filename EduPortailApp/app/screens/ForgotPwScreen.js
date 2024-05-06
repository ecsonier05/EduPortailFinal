import React from 'react';
import { StyleSheet, Text, TextInput, View, TouchableOpacity } from 'react-native';

export default function ForgotPwScreen(props) {
    return (
        <View style={styles.container}>
            <Text style={styles.forgotTitle}>Mot de passe oublié</Text>

            <View style={styles.emailTextFieldContainer}>
                <Text style={styles.textFieldLabel}>Courriel</Text>
                <TextInput style={styles.textField} />
            </View>

            <View style={styles.matriculeTextFieldContainer}>
                <Text style={styles.textFieldLabel}>Matricule</Text>
                <TextInput style={styles.textField} />
            </View>

            {/*pop up for confirmation*/}
            <TouchableOpacity style={styles.buttonConfirm}>
                <Text style={styles.textConfirm}>Confirmer</Text>
            </TouchableOpacity>
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#E0E0E0',
        alignItems: 'center',
        justifyContent: 'center',
    },
    forgotTitle: {
        fontSize: 50,
        fontWeight: 'bold',
        position: 'absolute',
        top: 100
    },
    textFieldLabel: {
        paddingBottom: 5
    },
    textField: {
        backgroundColor: 'white',
        width: '100%',
        height: 60,
        borderRadius: 5,
        fontSize: 20,
        paddingHorizontal: 10,
    },
    emailTextFieldContainer: {
        width: '80%',
        position: 'absolute',
        top: 250,
    },
    matriculeTextFieldContainer: {
        width: '80%',
        position: 'absolute',
        top: 375,
    },
    buttonConfirm: {
        backgroundColor: '#3d88ec',
        width: '80%',
        height: 55,
        borderRadius: 5,
        alignItems: 'center',
        justifyContent: 'center',
        position: 'absolute',
        top: 500,
    },
    textConfirm: {
        fontSize: 20,
        lineHeight: 21,
        fontWeight: 'bold',
        letterSpacing: 0.25,
        color: 'white',
    },
})