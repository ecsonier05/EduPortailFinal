import React from 'react';
import { Text, View, StyleSheet, TouchableOpacity } from 'react-native';

export default function EvalScreen(props) {
    return (
        <View style={styles.container}>
            <Text style={styles.evalTitle}>Mes évaluations</Text>

            <Text style={styles.evalSessionText}>Session actuelle: Printemps 2024</Text>

            <View style={styles.classLabels}>
                <Text style={styles.sigleLabel}>Sigle</Text>
                <Text style={styles.titleLabel}>Titre du cour</Text>
            </View>
            <View style={styles.classContainer}>
                {/*Loop here for classes*/}
                <View style={styles.classRow}>
                    <TouchableOpacity style={styles.classButton}>
                        <Text style={styles.sigleText}>PROG1297</Text>
                        <Text style={styles.classText}>Programmation Web PHP et Ajax</Text>
                    </TouchableOpacity>
                </View>
                <View style={styles.classRow}>
                    <TouchableOpacity style={styles.classButton}>
                        <Text style={styles.sigleText}>PROG1301</Text>
                        <Text style={styles.classText}>Projet de developpement d'applications informatiques</Text>
                    </TouchableOpacity>
                </View>
                <View style={styles.classRow}>
                    <TouchableOpacity style={styles.classButton}>
                        <Text style={styles.sigleText}>PROG1342</Text>
                        <Text style={styles.classText}>Developpement d'applications mobiles multiplateformes</Text>
                    </TouchableOpacity>
                </View>
            </View>
        </View>
    );
}

const styles = StyleSheet.create({
    //main Container
    container: {
        flex: 1,
        backgroundColor: '#E0E0E0',
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
        backgroundColor: '#70bbff',
        height: 70,
        alignItems: 'center',
        borderWidth: 2,
        borderRadius: 5,
        borderColor: '#3d88ec'
    },
    sigleText: {
        flex: 1,
        marginLeft: 25,
        fontSize: 20,
    },
    classText: {
        flex: 2,
        marginRight: 25,
    },
})