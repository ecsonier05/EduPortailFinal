import React from 'react';
import { Text, Image, TouchableOpacity, StyleSheet, View, TextInput } from 'react-native';

export default function LoginScreen({ navigation }) {
    return (
        <View style={styles.container}>
            <Text style={styles.loginTitle}>EduPortail</Text>

            <Image 
                source={require("../assets/EduPortailLogo.png")}
                style={styles.loginIcon}
            />

            <Text style={styles.connectText}>Connection</Text>

            <View style={styles.nomTextFieldContainer}>
                <Text>Nom d'utilisateur</Text>
                <TextInput style={styles.textField} />
            </View>

            <View style={styles.pwTextFieldContainer}>
                <Text>Mot de passe</Text>
                <TextInput style={styles.textField} secureTextEntry={true} />
            </View>

            {/*add if condition for login*/}
            <TouchableOpacity style={styles.buttonConnect} onPress={() => navigation.navigate('Nav')}>
                <Text style={styles.textConnect}>Se connecter</Text>
            </TouchableOpacity>

            <View style={styles.helpContainer}>
                <TouchableOpacity onPress={() => navigation.navigate('Forgot')}>
                    <Text style={styles.forgetText}>Mot de passe oublié?</Text>
                </TouchableOpacity>

                <TouchableOpacity onPress={() => navigation.navigate('Create')}>
                    <Text style={styles.createText}>Créer un compte</Text>
                </TouchableOpacity>
            </View>
        </View>
    );
}

const styles = StyleSheet.create({ 
    container: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'flex-end',
        backgroundColor: '#E0E0E0',
    },
    loginTitle: {
        fontSize: 60,
        fontWeight: 'bold',
        position: 'absolute',
        top: 80
    },
    loginIcon: {
        width: 200,
        height: 220,
        position: 'absolute',
        top: 160
    },
    connectText: {
        fontSize: 30,
        fontWeight: 'bold',
        position: 'absolute',
        top: 400,
        left: 39
    },
    //for text fields
    nomTextFieldContainer: {
        width: '80%',
        position: 'absolute',
        top: 440,
    },
    pwTextFieldContainer: {
        width: '80%',
        position: 'absolute',
        top: 500,
    },
    textField: {
        backgroundColor: 'white',
        width: '100%',
        height: 40,
        borderRadius: 5,
        fontSize: 20,
        paddingHorizontal: 10
    },
    buttonConnect: {
        backgroundColor: '#3d88ec',
        width: '80%',
        height: 40,
        borderRadius: 5,
        alignItems: 'center',
        justifyContent: 'center',
        position: 'absolute',
        top: 570,
    },
    textConnect: {
        fontSize: 20,
        lineHeight: 21,
        fontWeight: 'bold',
        letterSpacing: 0.25,
        color: 'white',
    },
    helpContainer: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        position: 'absolute',
        top: 620,
        height: 40,
        width: '80%'
    },
    forgetText: {
        color: '#666666',
        fontWeight: 'bold'
    },
    createText: {
        color: '#3d88ec',
        fontWeight: 'bold'
    },
})
