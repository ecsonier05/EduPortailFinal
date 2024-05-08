import React from 'react';
import { Text, View, StyleSheet, TouchableOpacity } from 'react-native';

export default function EvalScreen({ navigation }) {

    const renderButtons = () => {

        const buttonItems = [];

        for (let i = 0; i < 3; i++) {
            buttonItems.push(
                <View style={styles.classRow} key={i}>
                    <TouchableOpacity style={styles.classButton} onPress={() => navigation.navigate('EvalClass', {id: "45b"})}>
                        <Text style={styles.sigleText}>PROG1297</Text>
                        <Text style={styles.classText}>Programmation Web PHP et Ajax</Text>
                    </TouchableOpacity>
                </View>
            );
        }

        return buttonItems;
    }

    return (
        <View style={styles.container}>
            <Text style={styles.evalTitle}>Mes évaluations</Text>

            {/*use api to display session*/}
            <Text style={styles.evalSessionText}>Session actuelle: Printemps 2024</Text>

            <View style={styles.classLabels}>
                <Text style={styles.sigleLabel}>Sigle</Text>
                <Text style={styles.titleLabel}>Titre du cour</Text>
            </View>
            <View style={styles.classContainer}>
                {renderButtons()}
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
    evalTitle: {
        position: 'absolute',
        top: 50,
        alignItems: 'center',
        fontSize: 40,
        fontWeight: 'bold',
    },
    evalSessionText: {
        position: 'absolute',
        top: 125,
        left: 40,
        fontSize: 18
    },
    classLabels: {
        flexDirection: 'row',
        width: '80%',
        position: 'absolute',
        top: 200
    },
    sigleLabel: {
        flex: 1,
        marginLeft: 5,
        fontWeight: 'bold',
    },
    titleLabel: {
        marginRight: 150,
        fontWeight: 'bold',
    },
    classContainer: {
        width: '90%',
        position: 'absolute',
        top: 225,
    },
    classRow: {
        paddingBottom: 2,
    },
    classButton: {
        flexDirection: 'row',
        backgroundColor: '#4b86b4',
        height: 70,
        alignItems: 'center',
        borderRadius: 5,
    },
    sigleText: {
        flex: 1,
        marginLeft: 25,
        fontSize: 20,
        fontWeight: 'bold',
        color: 'white'
    },
    classText: {
        flex: 2,
        marginRight: 25,
        fontWeight: 'bold',
        color: 'white'
    },
})